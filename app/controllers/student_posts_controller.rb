class StudentPostsController < ApplicationController


  def index
    @student_post = StudentPost.all.order('status, created_at DESC')
    @comment = Comment.new

    if params[:field] == "分野検索"
      @student_post = StudentPost.all.order('status, created_at DESC')
    elsif params[:field] == "フリースタイル"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    elsif params[:field] == "グラトリ"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    elsif params[:field] == "カービング"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    elsif params[:field] == "その他"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    end

  end
  
  def show
    @student_post = StudentPost.find(params[:id])
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
