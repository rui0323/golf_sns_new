class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @customer = current_customer
  end

  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(@post.customer.id)
  end
end
