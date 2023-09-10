class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com',
                       last_name: 'ゲスト',
                       first_name: 'ユーザ',
                       last_name_kana: 'ゲスト',
                       first_name_kana: 'ユーザ',
                       postal_code: '0000000',
                       address: '東京都渋谷区',
                       telephone_number: '09000000000',
                       is_deleted: false) do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  def customer_address_display
    '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
  end

  def full_name
    self.last_name + " " + self.first_name
  end

  def customer_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end

  end

end
