class CommentTeachersController < ApplicationController
  before_action :authenticate_user!

  def create
    @teacher_post = TeacherPost.find(params[:teacher_post_id])
    @comment = current_user.comment_teachers.new(comment_teacher_params)
    @comment.teacher_post_id = @teacher_post.id
    @comment.save
    @teacher_post.create_notification_comment!(current_user, @comment.id)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
    # 非同期化のためにコメントオフ
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @teacher_post = TeacherPost.find(params[:teacher_post_id])
    comment = CommentTeacher.find_by(id: params[:id], teacher_post_id: params[:teacher_post_id])
    comment.destroy
    # 非同期化のためにコメントオフ
    # redirect_back(fallback_location: root_path)
  end

  private

  def comment_teacher_params
    params.require(:comment_teacher).permit(:comment)
  end
end
