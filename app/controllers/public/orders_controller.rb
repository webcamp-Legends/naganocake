class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.post_code + current_customer.address
    @name = current_customer.last_name + current_customer.first_name
    @cart_items=current_customer.cart_items.all
  end

  def index
  end

  def show
  end

  def thanks
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.last_name + first_name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @order_details = OrderDetail.new
    current_customer.orders.each do |current_customer_order|
     @order_details.order_id = current_customer_order.id
    end

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price

      @order_details.amount = cart_item.amount
      @order_details.save
    end
    redirect_to orders_thanks_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_cost, :payment_method, :total_payment, :order_status)
  end
end
