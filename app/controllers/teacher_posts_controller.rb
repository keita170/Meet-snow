class TeacherPostsController < ApplicationController

  def index
    @teacher_post = TeacherPost.all.order('created_at DESC')
    @comment_teacher = CommentTeacher.new

    if params[:field] == "分野検索"
      @teacher_post = TeacherPost.all.order('created_at DESC')
    elsif params[:field] == "フリースタイル"
      @teacher_post = TeacherPost.where(field: params[:field])
    elsif params[:field] == "グラトリ"
      @teacher_post = TeacherPost.where(field: params[:field])
    elsif params[:field] == "カービング"
      @teacher_post = TeacherPost.where(field: params[:field])
    elsif params[:field] == "その他"
      @teacher_post = TeacherPost.where(field: params[:field])
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
