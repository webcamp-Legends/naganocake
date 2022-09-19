class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items,dependent: :destroy
  has_many :order_details

  validates :image, presence: true
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true

  def add_tax_price
    (self.price * 1.1).round
  end

  def is_active_check
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end

end
