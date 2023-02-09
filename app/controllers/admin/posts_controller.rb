class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    #@customer = Customer.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(params[:id])
  end
end
