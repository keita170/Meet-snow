class CommentsController < ApplicationController

  def create
    @student_post = StudentPost.find(params[:student_post_id])
    comment = current_user.comments.new(comment_params)
    comment.student_post_id = @student_post.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @student_post = StudentPost.find(params[:student_post_id])
    comment = Comment.find(params[:id])
     #comment = current_user.comments.find_by(id: @booki.id)

    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
