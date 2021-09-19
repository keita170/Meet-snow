class TeacherPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @teacher_post = TeacherPost.includes([:user,:comment_teachers,{ user: [:image_attachment] }]).page(params[:page]).order('status, created_at DESC').per(10)
    @comment_teacher = CommentTeacher.new
    # 絞り込み機能
    if params[:field] == "分野検索"
      @teacher_post = TeacherPost.page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "フリースタイル"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "グラトリ"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "カービング"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "その他"
      @teacher_post = TeacherPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    end

    @favorite_rank = TeacherPost.one_week
    @comment_rank = TeacherPost.one_week_comment
    @ranking_users = User.one_week_teacher_post
    @ranking_posts = TeacherPost.one_week_post
  end

  def show
    @comment_teacher = CommentTeacher.new
    # 閲覧数
    unless TeacherViewCount.find_by(user_id: current_user, teacher_post_id: @teacher_post.id)
      current_user.teacher_view_counts.create(teacher_post_id: @teacher_post.id)
    end
  end

  def new
    if current_user.status == "生徒"
      @teacher_post = TeacherPost.includes([:user,:comment_teachers,{ user: [:image_attachment] }]).page(params[:page]).order('status, created_at DESC').per(10)
      @comment_teacher = CommentTeacher.new
      @favorite_rank = TeacherPost.one_week
      @comment_rank = TeacherPost.one_week_comment
      @ranking_users = User.one_week_teacher_post
      @ranking_posts = TeacherPost.one_week_post
      flash[:alert] = 'ステータスを変更してください'
      render :index
    else
      @teacher_post = TeacherPost.new
    end
  end

  def create
    @teacher_post = TeacherPost.new(teacher_post_params)
    @teacher_post.user_id = current_user.id
    if @teacher_post.save
      flash[:notice] = '投稿しました'
      redirect_to teacher_posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @teacher_post.update(teacher_post_params)
      flash[:notice] = '投稿を編集しました'
      redirect_to teacher_posts_path
    else
      render :edit
    end
  end

  def destroy
    @teacher_post.destroy
    flash[:alert] = '投稿を削除しました'
    redirect_to teacher_posts_path
  end

  private

  def set_user
    @teacher_post = TeacherPost.find(params[:id])
  end

  def teacher_post_params
    params.require(:teacher_post).permit(:title, :body, :field, :status)
  end
end
