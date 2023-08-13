class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    @order_detail.update(order_detail_params)
    if OrderDetail.find_by(making_status: "manufacturing")
      @order.update_attribute(:status, "making")
      if @order_details.each do |order_detail|
        order_detail.making_status = "finish"
        @order.update_attribute(:status, "preparing_ship")
        end
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
