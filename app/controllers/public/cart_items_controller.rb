class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartIitem.new(cart_item_params)
    @cart_item.item_id.customer_id = cart_items_id
  end
  
  def index
    @cart_items = CartItem.All
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
