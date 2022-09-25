class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @order_details= @order.order_details
  end

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def update
    @order= Order.find(params[:id])
    @order_details= @order.order_details
    if @order.update(order_params)
      if @order.order_status == "payment_confirmation"
        @order.order_details.each do |order_detail|
          order_detail.update(making_status: "production_waiting")
        end
      end
      redirect_to admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :order_status)
  end

end


