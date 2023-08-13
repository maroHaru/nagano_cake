class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details
    # @orders = Order.all
    # @order_detail = OrderDetail.all
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order.update(order_params)
    if Order.find_by(status: "confirm_payment")
      @order_detail.update_attribute(:making_status, "wait_manufacture")
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
