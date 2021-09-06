class CommentTeachersController < ApplicationController

  def create
    @teacher_post = TeacherPost.find(params[:teacher_post_id])
    comment = current_user.comment_teachers.new(comment_teacher_params)
    comment.teacher_post_id = @teacher_post.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @teacher_post = TeacherPost.find(params[:teacher_post_id])
    comment = Comment.find(params[:id])
     #comment = current_user.comments.find_by(id: @booki.id)

    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_teacher_params
    params.require(:comment_teacher).permit(:comment)
  end

end
