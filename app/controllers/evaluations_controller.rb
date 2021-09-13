class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @evaluation = Evaluation.new
    @evaluations = Evaluation.page(params[:page]).order('created_at DESC').per(10)
    @users = User.all
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user_id = current_user.id
    @user = User.find(params[:evaluation][:user_option])
    @evaluation.user_select = @user.name
    if @evaluation.save
      flash[:notice] = '投稿しました'
      redirect_to evaluations_path
    else
      render :index
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy
    flash[:alert] = '投稿を削除しました'
    redirect_to evaluations_path
  end


  private

  def evaluation_params
    params.require(:evaluation).permit(:comment, :content, :user_select, :evaluation)
  end
end
