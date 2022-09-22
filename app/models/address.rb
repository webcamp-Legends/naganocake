class Address < ApplicationRecord
  belongs_to :customer
  validates :postcode, presence: true        ,length: { is: 7 }
  validates :address, presence: true          ,length: { in: 1..15 }
  validates :name, presence: true        ,length: { in: 1..15 }
  
  def address_display
    '〒' + postcode + ' ' + address + ' ' + name
  end
end
