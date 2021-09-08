class Admins::UsersController < ApplicationController

  def index
    @users = User.all
    # @student_post = @user.student_posts
    # @teacher_post = @user.teacher_posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_users_path
  end

  private

  def user_params
    params.require(:user).permit(:is_valid)
  end
end
