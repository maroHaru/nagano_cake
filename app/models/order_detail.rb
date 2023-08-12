class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    with_tax_price * amount
  end

  enum making_status: { impossible_manufacture: 0, wait_manufacture: 1, manufacturing: 2, finish: 3}

end
