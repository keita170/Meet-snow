class StudentPostsController < ApplicationController


  def index
    # インクリメンタルサーチで試してる記述----------------------------------------
    # keyword = params[:keyword]
    # @student_post = StudentPost.search(keyword)
    # @comment = Comment.new

    # if params[:student_post].present? #[:student_post]に値が入ってたら
    #   if params[:student_post].empty? #[:student_post]の中身が空だったら
    #     @student_post = StudentPost.all
    #     @comment = Comment.new
    #   else #[:student_post]の中身が空じゃなかったら
    #     @student_post = StudentPost.where('body LIKE?', "%#{params[:student_post][:keyword]}%")
    #     @comment = Comment.new
    #     # byebug
    #   end
    # else #[:student_post]が存在しなかったら
    # # byebug
    #   @student_post = StudentPost.all
    #   @comment = Comment.new
    # end
    # インクリメンタルサーチで試してる記述----------------------------------------

    @student_post = StudentPost.all.order('status, created_at DESC')
    @comment = Comment.new

    if params[:field] == "分野検索"
      @student_post = StudentPost.all.order('status, created_at DESC')
    elsif params[:field] == "フリースタイル"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    elsif params[:field] == "グラトリ"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    elsif params[:field] == "カービング"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    elsif params[:field] == "その他"
      @student_post = StudentPost.where(field: params[:field]).order('status, created_at DESC')
    end
    #ランキング機能
    @favorite_rank = StudentPost.one_week
    @comment_rank = StudentPost.one_week_comment
    @ranking_users = User.one_week_student_post
    @ranking_posts = StudentPost.one_week_post
  end

  def show
    @student_post = StudentPost.find(params[:id])
    @comment = Comment.new
    #閲覧数
    unless ViewCount.find_by(user_id: current_user, student_post_id: @student_post.id)
      current_user.view_counts.create(student_post_id: @student_post.id)
    end
  end

  def new
    @student_post = StudentPost.new
  end

  def create
    @student_post = StudentPost.new(student_post_params)
    @student_post.user_id = current_user.id
    @student_post.save
    redirect_to student_posts_path
  end

  def edit
    @student_post = StudentPost.find(params[:id])
  end

  def update
    @student_post = StudentPost.find(params[:id])
    @student_post.update(student_post_params)
    redirect_to student_posts_path
  end

  def destroy
    @student_post = StudentPost.find(params[:id])
    @student_post.destroy
    redirect_to student_posts_path
  end

  def search
    # @productsは次に紹介するjbuilderで必要になるインスタンス変数です
    # @student_post = StudentPost.where(['body LIKE(?)', "%#{params[:keyword]}%"])
    @student_post = StudentPost.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end


  private

  def student_post_params
    params.require(:student_post).permit(:title, :body, :field, :status)
  end

end
