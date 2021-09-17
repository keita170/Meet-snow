class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @student_post = StudentPost.find(params[:student_post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.student_post_id = @student_post.id
    @comment.save

    @student_post.create_notification_comment!(current_user, @comment.id)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
    # 非同期化のためにコメントオフ
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @student_post = StudentPost.find(params[:student_post_id])
    comment = Comment.find_by(id: params[:id], student_post_id: params[:student_post_id])
    comment.destroy
    # 非同期化のためにコメントオフ
    # redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
