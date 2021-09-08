class StudentPostsController < ApplicationController


  def index
    @student_post = StudentPost.all.order('created_at DESC')
    @comment = Comment.new
  end

  def new
    @student_post = StudentPost.new
  end

  def create
    @student_post = StudentPost.new(student_post_params)
    @student_post.user_id = current_user.id
    @student_post.save
    redirect_to student_posts_path
  end

  def edit
    @student_post = StudentPost.find(params[:id])
  end

  def update
    @student_post = StudentPost.find(params[:id])
    @student_post.update(student_post_params)
    redirect_to student_posts_path
  end

  def destroy
    @student_post = StudentPost.find(params[:id])
    @student_post.destroy
    redirect_to student_posts_path
  end

 
  private

  def student_post_params
    params.require(:student_post).permit(:title, :body, :field, :status)
  end

end
