class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @evaluation = Evaluation.new
    @evaluations = Evaluation.page(params[:page]).order('created_at DESC').per(10)
    @users = User.all
  end

  def create
      @user = User.find(params[:user_select])
      @evaluation = Evaluation.new(evaluation_params)
      @evaluation.user_id = @user.id
      @evaluation.post_user = current_user.id
      if @evaluation.save
        flash[:notice] = '投稿しました'
        redirect_to user_path(@user)
      else
        @student_post = @user.student_posts.page(params[:page]).order('status, created_at DESC').per(10)
        @teacher_post = @user.teacher_posts.page(params[:page]).order('status, created_at DESC').per(10)
        @comment = Comment.new
        @comment_teacher = CommentTeacher.new
        @evaluations = Evaluation.where(user_id: @user).page(params[:page]).order('created_at DESC').per(10)
        render "users/show"
      end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @user = @evaluation.user
    @evaluation.destroy
    flash[:alert] = '投稿を削除しました'
    redirect_to user_path(@user)
  end


  private

  def evaluation_params
    params.require(:evaluation).permit(:comment, :content, :user_select, :evaluation)
  end
end
