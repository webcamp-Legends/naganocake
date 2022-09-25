class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details=OrderDetail.find(params[:id])
    @order= @order_details.order
    if@order_details.update(order_details_params)
      if @order.order_details.any?{|order_detail| order_detail.making_status == "in_production"}
        @order.update(order_status: "in_production")
      elsif@order.order_details.all?{|order_detail| order_detail.making_status == "completed"}
        @order.update(order_status: "preparing_delivery")
      end
      redirect_to admin_order_path(@order)
    end
  end
  
  private
  
  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
  
end