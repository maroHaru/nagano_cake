class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def index
    @addresses = Address.all
    @address = Address.new
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
