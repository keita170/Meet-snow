class TeacherPostsController < ApplicationController

  def index
    @teacher_post = TeacherPost.page(params[:page]).order('status, created_at DESC').per(10)
    @comment_teacher = CommentTeacher.new

    if params[:field] == "分野検索"
      @teacher_post = TeacherPost.page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "フリースタイル"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "グラトリ"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "カービング"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "その他"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    end
    
    @favorite_rank = TeacherPost.one_week
    @comment_rank = TeacherPost.one_week_comment
    @ranking_users = User.one_week_teacher_post
    @ranking_posts = TeacherPost.one_week_post
    
  end

  def show
    @teacher_post = TeacherPost.find(params[:id])
    @comment_teacher = CommentTeacher.new
    #閲覧数
    unless TeacherViewCount.find_by(user_id: current_user, teacher_post_id: @teacher_post.id)
      current_user.teacher_view_counts.create(teacher_post_id: @teacher_post.id)
    end
  end

  def new
    @teacher_post = TeacherPost.new
  end

  def create
    @teacher_post = TeacherPost.new(teacher_post_params)
    @teacher_post.user_id = current_user.id
    @teacher_post.save
    redirect_to teacher_posts_path
  end

  def edit
    @teacher_post = TeacherPost.find(params[:id])
  end

  def update
    @teacher_post = TeacherPost.find(params[:id])
    @teacher_post.update(teacher_post_params)
    redirect_to teacher_posts_path
  end

  def destroy
    @teacher_post = TeacherPost.find(params[:id])
    @teacher_post.destroy
    redirect_to teacher_posts_path
  end

  private

  def teacher_post_params
    params.require(:teacher_post).permit(:title, :body, :field, :status)
  end

end
