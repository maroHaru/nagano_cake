class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  def get_image
    image
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def sales_status
    if is_active == false
      "販売中止中"
    else
      "販売中"
    end
  end

end
