class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end

  def index

  end

  def show
  end

  def thanks
  end

  def confirm
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_thanks_path
    else
       @order = Order.new
       render "confirm"
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_cost, :payment_method, :total_payment, :order_status)
  end
end
