class User::CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    if cart_item_params[:amount].present?
      CartItem.update_or_create(current_user.id, cart_item_params[:item_id], cart_item_params[:amount])
      redirect_to cart_items_path
    else
    end
  end

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice]= "更新しました"
      redirect_to request.referer
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_user.cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.dig(:cart_item) ? params.require(:cart_item).permit(:item_id, :amount) : params.permit(:item_id, :amount)
  end

end
