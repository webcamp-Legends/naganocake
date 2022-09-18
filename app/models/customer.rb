class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, presence: true        ,length: { in: 1..15 }
  validates :first_name, presence: true       ,length: { in: 1..15 }
  validates :last_name_kana, presence: true   ,length: { in: 1..15 }
  validates :first_name_kana, presence: true  ,length: { in: 1..15 }
  validates :post_code, presence: true        ,length: { is: 7 }
  validates :address, presence: true          ,length: { in: 1..15 }
  validates :phone_number, presence: true     ,length: { in: 1..15 }
  
end
