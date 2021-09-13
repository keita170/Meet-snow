class RoomsController < ApplicationController

  def create

    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    @rooms = current_user.rooms.includes(:messages).order("messages.created_at desc")

    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries.includes(:user)

    else
      redirect_back(fallback_location: root_path)
    end

  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def index

    @rooms = current_user.rooms.includes(:messages).order("messages.created_at desc")

  end


end
