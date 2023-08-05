class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    # @order.customer_id = Address.find_by(customer_id: params[:address][:customer_id])


    # @customer = current_customer
    # @customers = Customer.all
    # @addresses = Address.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_confirm_path
  end

  def confirm
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end
