class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total_payment = 0
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items= current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item.id==@cart_item.item.id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to :cart_items
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:images,:item_id, :amount, :customer_id )
  end

end
