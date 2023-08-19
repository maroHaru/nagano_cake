class Public::CartItemsController < ApplicationController

  def create
    # @item = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @item.present?
      new_amount = @item.amount + @cart_item.amount
      # @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id]).amount += params[:cart_item][:amount].to_i
       @item.update_attribute(:amount, new_amount)
    else
      @cart_item.save

    end
    redirect_to cart_items_path
 
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.all
    @total = 0
    @cart_item = CartItem.new
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
