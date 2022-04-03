class Admin::OrderDetailsController < ApplicationController


  def update
   @order = Order.find(params[:id])
   @order_detail = OrderDetail.find(params[:id])
   @order_detail.update(order_detail_params)
   redirect_to admin_order_path(@order.id)

  end


private
  def order_detail_params
    params.permit(:purchase_price, :amount, :item_id, :order_id, :making_status)
  end

end
