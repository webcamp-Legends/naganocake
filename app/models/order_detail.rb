class OrderDetail < ApplicationRecord
  enum making_status: { disabled: 0, production_waiting: 1, in_production:2, completed:3 }
end
