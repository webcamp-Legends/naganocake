class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @order_details= @order.order_details
  end

  def index
    @orders = Order.all
  end

  def update
    @order= Order.find(params[:id])
    @order_details= @order.order_details
    
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :order_status)
  end

end


