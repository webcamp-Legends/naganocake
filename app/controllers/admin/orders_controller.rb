class Admin::OrdersController < ApplicationController
  def show
  end
  
  def update
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :order_status)
  end
  
end
