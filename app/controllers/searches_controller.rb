class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @student_post = StudentPost.search(params[:keyword]).page(params[:page]).reorder('status, created_at DESC').per(10)
    @keyword = params[:keyword]
    @comment = Comment.new

    @favorite_rank = StudentPost.one_week
    @comment_rank = StudentPost.one_week_comment
    @ranking_users = User.one_week_student_post
    @ranking_posts = StudentPost.one_week_post
  end
end
