class Admins::UsersController < ApplicationController

  def index
    @users = User.all
    # @student_post = @user.student_posts
    # @teacher_post = @user.teacher_posts

    # if params[:sort] == 'is_valid'
    #   @users = User.all.order('is_valid DESC')
    # elsif params[:sort] == 'id'
    #   @users = User.all
    # elsif params[:sort] == 'post'
    #   @users = User.all.order('is_valid DESC')
    # elsif params[:sort] == 'follow'
    #   @users = User.all.order('following_user.count DESC')
    # end

    if params[:sort] == 'id'
      @users = User.all
    elsif params[:sort] == 'id-reverse'
      @users = User.all.order('id DESC')
    elsif params[:sort] == 'is_valid'
      @users = User.all.order('is_valid DESC')
    elsif params[:sort] == 'is_valid-reverse'
      @users = User.all.order('is_valid')
    elsif params[:sort] == 'follow'
      @users = User.includes(:following_user).sort{|a,b| b.following_user.includes(:follower).size <=> a.following_user.includes(:follower).size}
    elsif params[:sort] == 'follower'
      @users = User.includes(:followed_user).sort{|a,b| b.followed_user.includes(:followed).size <=> a.followed_user.includes(:followed).size}
    elsif params[:sort] == 'post'
      @users = User.includes(:student_posts, :teacher_posts).sort{|a,b| b.student_posts.includes(:id).size + b.teacher_posts.includes(:id).size <=> a.student_posts.includes(:id).size + a.teacher_posts.includes(:id).size}
    end
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
