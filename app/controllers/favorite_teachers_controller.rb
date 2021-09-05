class FavoriteTeachersController < ApplicationController
  def create
    @teacher_post = StudentPost.find(params[:teacher_post_id])
    @favorite = current_user.favorite_teachers.new(teacher_post_id: @teacher_post.id)
    @favorite.save
    # @favorite = Favorite.create(user_id: current_user.id, student_post_id: @student_post.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @teacher_post = StudentPost.find(params[:teacher_post_id])
    @favorite = current_user.favorite_teachers.find_by(teacher_post_id: @teacher_post.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
