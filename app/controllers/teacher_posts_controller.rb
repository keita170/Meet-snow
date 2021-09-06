class TeacherPostsController < ApplicationController

  def index
    @teacher_post = TeacherPost.all
    @comment_teacher = CommentTeacher.new
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


  private

  def teacher_post_params
    params.require(:teacher_post).permit(:title, :body, :field)
  end

end
