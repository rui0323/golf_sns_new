class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def index
      @customers = Customer.all
      #@customer = Customer.find(params[:id])
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)

    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_customers_path
  end

end
