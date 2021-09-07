class FavoritesController < ApplicationController

  def create
    #生徒側
    @student_post = StudentPost.find(params[:student_post_id])
    @favorite = current_user.favorites.new(student_post_id: @student_post.id)
    @favorite.save
    #非同期化のためにコメントアウトにする
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    #生徒側
    @student_post = StudentPost.find(params[:student_post_id])
    @favorite = current_user.favorites.find_by(student_post_id: @student_post.id)
    @favorite.destroy
    #非同期化のためにコメントアウトにする
    # redirect_back(fallback_location: root_path)
  end


end
