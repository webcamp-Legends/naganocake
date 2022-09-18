class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  has_many :order_details

  def add_tax_price
    (self.price * 1.08).round
  end

  def is_active_check
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end

end
