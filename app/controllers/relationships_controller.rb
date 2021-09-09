class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
    redirect_back(fallback_location:root_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location:root_path)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followed_user
    @users_follower = user.following_user
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followed_user
    @users_follower = user.following_user
  end


end
