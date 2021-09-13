class SearchUsersController < ApplicationController
  before_action :authenticate_user!

  def search
    @evaluations = Evaluation.search(params[:user_keyword]).page(params[:page]).reorder('created_at DESC').per(10)
    @user_keyword = params[:user_keyword]
    @users = User.all
  end

end
