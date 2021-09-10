class EvaluationsController < ApplicationController
  def index
    @evaluation = Evaluation.new
    @evaluations = Evaluation.all
    @users = User.all
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user_id = current_user.id
    @user = User.find(params[:evaluation][:user_option])
    @evaluation.user_select = @user.name
    @evaluation.save
    redirect_to evaluations_path
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy
    redirect_to evaluations_path
  end


  private

  def evaluation_params
    params.require(:evaluation).permit(:comment, :content, :user_select, :evaluation)
  end
end
