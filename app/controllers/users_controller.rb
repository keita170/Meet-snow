class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @student_post = @user.student_posts
    @teacher_post = @user.teacher_posts
    @comment = Comment.new
    @comment_teacher = CommentTeacher.new
    
    #DM機能のための記述
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |current|
        @userEntry.each do |user|
          if current.room_id == user.room_id then
            @isRoom = true
            @roomId = current.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
