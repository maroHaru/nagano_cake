class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details
    # @orders = Order.all
    # @order_detail = OrderDetail.all
  end
end
