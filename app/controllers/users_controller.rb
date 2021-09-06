class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @student_post = @user.student_posts
    @teacher_post = @user.teacher_posts
    @comment = Comment.new
    @comment_teacher = CommentTeacher.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
