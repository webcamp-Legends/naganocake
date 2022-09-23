class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }, _prefix: true
  
  has_many :order_details
  belongs_to :customer

end
