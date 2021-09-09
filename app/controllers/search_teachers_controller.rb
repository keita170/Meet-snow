class SearchTeachersController < ApplicationController

  def search
    @teacher_post = TeacherPost.search_teacher(params[:key_word])
    @key_word = params[:key_word]
    @comment_teacher = CommentTeacher.new
  end

end
