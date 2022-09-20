class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_many_attached :images
  
  def subtotal
    item.add_tax_price*amount
  end
  
  
end
