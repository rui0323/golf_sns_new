class Public::FavoritesController < ApplicationController
   before_action :ensure_sign_in_customer

  def create
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: @post.id)
    favorite.save
    #redirect_to request.referer

  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: @post.id)
    favorite.destroy
   # redirect_to request.referer

  end


  def index
    @favorite_posts = Post.find(favorites)
  end


end
