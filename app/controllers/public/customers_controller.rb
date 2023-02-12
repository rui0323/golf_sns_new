class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])

    @posts = @customer.posts
  end

  def index
    @customers = Customer.all
    @customer = current_customer
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "会員情報が正常に保存されました"
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

 def favorites
     @customer = Customer.find(params[:id])
     favorites= Favorite.where(customer_id: @customer.id).pluck(:post_id)
     @favorite_posts = Post.find(favorites)
 end

 def unsubscribe
 end

  def withdraw
  end

  private
  def customer_params
  	  params.require(:customer).permit(:name,  :email, :password,  :address, :body, :image)
  end



end
