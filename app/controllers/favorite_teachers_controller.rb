class FavoriteTeachersController < ApplicationController
  def create
    @teacher_post = TeacherPost.find(params[:teacher_post_id])
    @favorite = current_user.favorite_teachers.new(teacher_post_id: @teacher_post.id)
    @favorite.save
    #非同期化の為コメントアウト
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @teacher_post = TeacherPost.find(params[:teacher_post_id])
    @favorite = current_user.favorite_teachers.find_by(teacher_post_id: @teacher_post.id)
    @favorite.destroy
    #非同期化の為コメントアウト
    # redirect_back(fallback_location: root_path)
  end
end
