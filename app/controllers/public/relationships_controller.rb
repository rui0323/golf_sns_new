class Public::RelationshipsController < ApplicationController
   before_action :ensure_sign_in_customer

  def create
    #current_customer.follow(params[:customer_id])
     @customer = Customer.find(params[:customer_id])
    following = current_customer.follow(params[:customer_id])
    following.save
    #redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
     ##current_customer.unfollow(params[:customer_id])
     @customer = Customer.find(params[:customer_id])
     following = current_customer.unfollow(params[:customer_id])
     following.destroy
    #redirect_to request.referer
  end
  # フォロー一覧
  def followings
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings
  end
  # フォロワー一覧
  def followers
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers
  end
end

