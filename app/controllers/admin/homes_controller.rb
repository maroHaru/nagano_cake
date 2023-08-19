class Admin::HomesController < ApplicationController

  def top
    @orders = Order.order('id DESC')
    @customers = Customer.all
    @order_detail = OrderDetail.all
  end
end
