class Admin::OrderDetailsController < ApplicationController
  def update
     @order_details=OrderDetail.find(params[:id])
     @order= @order_details.order
    if
      @order_details.update(order_details_params)
      if @order.order_details.any?{|order_detail| order_detail.making_status == "製作中"}
        @order.update(order_status: "製作中")
      end
      if @order.order_details.all?{|order_detail| order_detail.making_status == "製作完了"}
        @order.update(order_status: "発送準備中")
      end
      redirect_to admin_order_path(@order_details.order)
    else
      render admin_order_path
    end
  end
  
  private
  
  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
  
end