class SearchTeachersController < ApplicationController

  def search
    @teacher_post = TeacherPost.search_teacher(params[:key_word]).reorder('status, created_at DESC')
    @key_word = params[:key_word]
    @comment_teacher = CommentTeacher.new
    
    @favorite_rank = TeacherPost.one_week
    @comment_rank = TeacherPost.one_week_comment
    @ranking_users = User.one_week_teacher_post
    @ranking_posts = TeacherPost.one_week_post
  end

end
