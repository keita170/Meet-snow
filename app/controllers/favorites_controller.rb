class FavoritesController < ApplicationController

  def create
    #生徒側
    @student_post = StudentPost.find(params[:student_post_id])
    @favorite = current_user.favorites.new(student_post_id: @student_post.id)
    @favorite.save
    # @favorite = Favorite.create(user_id: current_user.id, student_post_id: @student_post.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    #生徒側
    @student_post = StudentPost.find(params[:student_post_id])
    @favorite = current_user.favorites.find_by(student_post_id: @student_post.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end


end
