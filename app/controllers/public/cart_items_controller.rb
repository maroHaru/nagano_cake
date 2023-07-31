class Public::CartItemsController < ApplicationController
 before_action :destroy_all, only: [:destroy]

  def create
    @item = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @item = CartItem.find_by(item_id: params[:cart_item][:item_id])
       @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id]).amount += params[:cart_item][:amount].to_i
       @cart_item.update(cart_item_params)
    else  @cart_item.save
      redirect_to cart_items_path
    end
  end

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    CartItem.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
