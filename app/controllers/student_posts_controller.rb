class StudentPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @student_post = StudentPost.page(params[:page]).order('status, created_at DESC').per(10)
    @comment = Comment.new
    # 絞り込み機能
    if params[:field] == "分野検索"
      @student_post = StudentPost.page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "フリースタイル"
      @student_post = StudentPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "グラトリ"
      @student_post = StudentPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "カービング"
      @student_post = StudentPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    elsif params[:field] == "その他"
      @student_post = StudentPost.where(field: params[:field]).page(params[:page]).order('status, created_at DESC').per(10)
    end
    # ランキング機能
    @favorite_rank = StudentPost.one_week
    @comment_rank = StudentPost.one_week_comment
    @ranking_users = User.one_week_student_post
    @ranking_posts = StudentPost.one_week_post
  end

  def show
    @comment = Comment.new
    # 閲覧数カウント
    unless ViewCount.find_by(user_id: current_user, student_post_id: @student_post.id)
      current_user.view_counts.create(student_post_id: @student_post.id)
    end
  end

  def new
    if current_user.status == "先生"
      @student_post = StudentPost.page(params[:page]).order('status, created_at DESC').per(10)
      @comment = Comment.new
      @favorite_rank = StudentPost.one_week
      @comment_rank = StudentPost.one_week_comment
      @ranking_users = User.one_week_student_post
      @ranking_posts = StudentPost.one_week_post
      flash[:alert] = 'ステータスを変更してください'
      render :index
    else
      @student_post = StudentPost.new
    end
  end

  def create
    @student_post = StudentPost.new(student_post_params)
    @student_post.user_id = current_user.id
    @student_post.user_name = @student_post.user.name
    if @student_post.save
      flash[:notice] = '投稿しました'
      redirect_to student_posts_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @student_post.update(student_post_params)
      flash[:notice] = '投稿を編集しました'
      redirect_to student_posts_path
    else
      render :edit
    end
  end

  def destroy
    @student_post.destroy
    flash[:alert] = '投稿を削除しました'
    redirect_to student_posts_path
  end

  def search
    # @student_postは次に紹介するjbuilderで必要になるインスタンス変数です
    @student_post = StudentPost.search(params[:keyword])
    render :json => @student_post
  end

  def check
  end

  def ranking
    @favorite_rank = StudentPost.one_week
    @comment_rank = StudentPost.one_week_comment
    @ranking_users = User.one_week_student_post
    @ranking_posts = StudentPost.one_week_post
  end

  private

  def set_user
    @student_post = StudentPost.find(params[:id])
  end

  def student_post_params
    params.require(:student_post).permit(:title, :body, :field, :status)
  end
end
