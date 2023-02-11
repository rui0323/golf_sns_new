class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def index
      @customers = Customer.all
      #@customer = Customer.find(params[:id])
  end


end
