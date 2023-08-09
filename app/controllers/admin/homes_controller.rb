class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @customers = Customer.all
    @order_detail = OrderDetail.all
  end
end
