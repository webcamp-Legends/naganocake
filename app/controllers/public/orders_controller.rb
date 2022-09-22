class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end

  def index

  end

  def show
    @order=Order.find(params[:id])
  
    
    
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)

    if params [:order][:delivery_target] == 0
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.last_name = current_customer.name
    @order.first_name = current_customer.name
    @order.shipping_cost = shipping_cost
    @order.total_payment = current_customer.cart_items.total_payment

    elsif params [:order][:delivery_target] == 1

    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.name

    else

    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.name

    end
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
