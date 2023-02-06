class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
    @customer = current_customer
  end

  def edit
     @customer = Customer.find(params[:id])
  end

 def unsubscribe
 end

  def withdraw
  end

  private
  def customer_params
  	  params.require(:customer).permit(:name,  :email, :password,  :address)
  end

end
