class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_confirm_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method)
  end
  
end
