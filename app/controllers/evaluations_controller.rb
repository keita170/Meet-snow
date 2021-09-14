class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @evaluation = Evaluation.new
    @evaluations = Evaluation.page(params[:page]).order('created_at DESC').per(10)
    @users = User.all
  end

  def create
    byebug
      @user = request.path.user
      @evaluation = Evaluation.new(evaluation_params)
      @evaluation.user_id = @user.id
      if @evaluation.save
        flash[:notice] = '投稿しました'
        redirect_to user_path(@user)
      else
        render :index
      end
  end

  def destroy
    @user = User.find(params[:id])
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy
    flash[:alert] = '投稿を削除しました'
    redirect_to user_path(@user)
  end


  private

  def evaluation_params
    params.require(:evaluation).permit(:comment, :content, :user_select, :evaluation)
  end
end
