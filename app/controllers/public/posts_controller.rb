class Public::PostsController < ApplicationController
    before_action :ensure_sign_in_customer

  def new
    @post = Post.new
    @customer = current_customer
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
    redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @customer = current_customer
    @posts = Post.where(customer_id: @customer.followings.ids).order(created_at: :desc).page(params[:page])

    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.all.page(params[:page]).per(5)
    @customer = Customer.find(@post.customer.id)
  end

  def edit
    @post = Post.find(params[:id])
    @customer = current_customer
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])  # データ（レコード）を1件取得
    post.destroy  # データ（レコード）を削除
    redirect_to posts_path # 投稿一覧画面へリダイレクト
  end


  def search
    if params[:keyword].present?
      @posts = Post.where('caption LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

   # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :caption, image: [])
  end




end
