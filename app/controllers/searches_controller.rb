class SearchesController < ApplicationController

  def search
    @student_post = StudentPost.search(params[:keyword])
    @keyword = params[:keyword]
    @comment = Comment.new

  end
end
