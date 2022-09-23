class Admin::OrderDetailsController < ApplicationController
  def update
     @order= OrderDetail.find(params[:id])
    @order.update(order_details_params)
    redirect_to admin_order_path(@order)
  end
  
  private
  
  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
  
end