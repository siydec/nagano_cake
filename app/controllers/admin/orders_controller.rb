class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details.pluck(:making_status)
  if @order.status == "shipment"
  elsif @order.status == "complete"
  else

   if @order_details.all? { |d| d == "complete"}
     @order.status = "shipment"
     @order.update(order_params)
   end
  end
end

def update
   @order = Order.find(params[:id])
   @order.update(order_params)

    if @order.status == "confirmation"
     @order_details = @order.order_details
     @order_details.each do |detail|
       detail.making_status = 1
       detail.update(order_detail_params)
      end
    end
    redirect_to action: "show"

end

private

  def order_params
    params.permit(:payment, :delivery_address, :delivery_postal_code,:delivery_name, :postage, :billing_amount, :status)
  end

  def order_detail_params
    params.permit(:purchase_price, :amount, :item_id, :order_id,)
  end




end
