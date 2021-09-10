class SearchUsersController < ApplicationController
  
  def search
    @evaluations = Evaluation.search(params[:user_keyword])
    @user_keyword = params[:user_keyword]
  end
  
end
