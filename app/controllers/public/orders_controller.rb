class Public::OrdersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def thanks
  end

  def confirm
  end
  
  def create
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_cost, :payment_method)
  end
end
