class SearchesController < ApplicationController

  def search
    @student_post = StudentPost.search(params[:keyword]).reorder('status, created_at DESC')
    @keyword = params[:keyword]
    @comment = Comment.new

  end
end
