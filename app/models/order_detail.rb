class OrderDetail < ApplicationRecord
<<<<<<< HEAD
  enum making_status: { disabled: 0, production_waiting: 1, in_production:2, completed:3 }
=======
  enum making_status: { disabled: 0, production_waiting: 1, in_production: 2, completed: 3 }
  
  belongs_to :item
  belongs_to :order
>>>>>>> origin/develop
end
