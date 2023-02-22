class Admin::PostsController < ApplicationController
   #管理者としてログインしてない場合はURLから入れない
   before_action :ensure_sign_in_admin

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
    @post = Post.new
    @customer = current_customer
  end

  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(@post.customer.id)
  end

  def destroy
    post = Post.find(params[:id])  # データ（レコード）を1件取得
    post.destroy  # データ（レコード）を削除
    redirect_to admin_posts_path # 投稿一覧画面へリダイレクト
  end

end
