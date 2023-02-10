class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
     @posts = Post.all
  end

  def index
      @customers = Customer.all
  end


end
