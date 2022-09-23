class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.post_code + current_customer.address
    @name = current_customer.last_name + current_customer.first_name
    @cart_items=current_customer.cart_items.all
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order=current_customer.orders.find(params[:id])
    @order_details=@order.order_details.all
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
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
  end

  def create
    @order = Order.new(order_params)
    
    @order.save
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.order_id =@order.id
        @order_details.amount = cart_item.amount
        @order_details.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :post_code, :address, :name, :shipping_cost, :payment_method, :total_payment, :order_status)
  end
end
