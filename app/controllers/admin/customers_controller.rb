class Admin::CustomersController < ApplicationController
   　#管理者としてログインしてないときはURLから入れない
   　before_action :ensure_sign_in_admin
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(7)
  end

  def index
      @customers = Customer.all.page(params[:page])
      #@customer = Customer.find(params[:id])
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    flash[:notice] = "退会処理を実行いたしました"
   #管理者がユーザーを利用停止した場合会員一覧へ遷移する
    redirect_to admin_customers_path
  end

end
