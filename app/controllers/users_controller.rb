class UsersController < ApplicationController

  before_action :set_user, only: [:likes]


  def show

    @user = User.find(params[:id])
    @student_post = @user.student_posts.order('status, created_at DESC')
    @teacher_post = @user.teacher_posts.order('status, created_at DESC')
    @comment = Comment.new
    @comment_teacher = CommentTeacher.new

    #DM機能のための記述
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |current|
        @userEntry.each do |user|
          if current.room_id == user.room_id then
            @isRoom = true
            @roomId = current.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

    


  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end


  def favorites
    # ログイン中のユーザーのお気に入りのteacher_post_idカラムを取得
    favorites = Favorite.where(user_id: current_user.id).order('created_at DESC').pluck(:student_post_id)
    @favorite_list = StudentPost.order('status, created_at DESC').find(favorites)
    #ソート機能
    if params[:sort] == 'status'
      favorites = Favorite.where(user_id: current_user.id).order('created_at DESC').pluck(:student_post_id)
      @favorite_list = StudentPost.order('status, created_at DESC').find(favorites)
    elsif params[:sort] == 'field'
      favorites = Favorite.where(user_id: current_user.id).order('created_at DESC').pluck(:student_post_id)
      @favorite_list = StudentPost.order('status, field, created_at DESC').find(favorites)
    elsif params[:sort] == 'comment'
      favorites = Favorite.where(user_id: current_user.id).order('created_at DESC').pluck(:student_post_id)
      favorite_list = StudentPost.includes(:commented_users).sort{ |a, b| b.comments.count <=> a.comments.count }.find(favorites)
      #enumeratorとして出されてしまってるので以下、enumeratorから1つずつ取り出してる記述
      @favorite_list = []
      favorites.count.times do
        @favorite_list << favorite_list.next
      end
      # loop { @favorite_list << favorite_list.next }
      # byebug
      # @my_post_like_ranks = current_user.posts.sort { |a, b| b.likes.count <=> a.likes.count }
      # @favorite_list = StudentPost.includes(:commented_users).sort{|a,b| b.commented_users.includes(:comments).size <=> a.commented_users.includes(:comments).size}.find(favorites)

      # .joins(:friends).where("friends.id IS NOT NULL")
      # .includes(:followed_user).sort{|a,b| b.followed_user.includes(:followed).size <=> a.followed_user.includes(:followed).size}
    end


    # ログイン中のユーザーのお気に入りのteacher_post_idカラムを取得
    favorite_teachers = FavoriteTeacher.where(user_id: current_user.id).order('created_at DESC').pluck(:teacher_post_id)
    @favorite_list_teacher = TeacherPost.order('status, created_at DESC').find(favorite_teachers)
    #先生側ソート機能
    if params[:sort] == 'status-teacher'
      favorite_teachers= FavoriteTeacher.where(user_id: current_user.id).order('created_at DESC').pluck(:teacher_post_id)
      @favorite_list_teacher = TeacherPost.order('status, created_at DESC').find(favorite_teachers)
    elsif params[:sort] == 'field-teacher'
      favorite_teachers= FavoriteTeacher.where(user_id: current_user.id).order('created_at DESC').pluck(:teacher_post_id)
      @favorite_list_teacher = TeacherPost.order('status, field, created_at DESC').find(favorite_teachers)
    elsif params[:sort] == 'comment-teacher'
      favorite_teachers= FavoriteTeacher.where(user_id: current_user.id).order('created_at DESC').pluck(:teacher_post_id)
      favorite_list_teacher = TeacherPost.includes(:commented_users).sort{ |a, b| b.comment_teachers.count <=> a.comment_teachers.count }.find(favorite_teachers)
      #enumeratorとして出されてしまってるので以下、enumeratorから1つずつ取り出してる記述
      @favorite_list_teacher = []
      favorite_teachers.count.times do
        @favorite_list_teacher << favorite_list_teacher.next
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
