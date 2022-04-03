class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

def show
  @order = Order.find(params[:id])


end

def update
  @order = Order.find(params[:id])
  @order.update(order_params)
  redirect_to action: "show"

end

private

  def order_params
    params.permit(:payment, :delivery_address, :delivery_postal_code,:delivery_name, :postage, :billing_amount, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:purchase_price, :amount, :item_id, :order_id,)
  end




end
