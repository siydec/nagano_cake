class Admin::OrdersController < ApplicationController

def show
  @order_detail = Order_detail.find(params[:id])
end

def update
  @oreder_detail = Order_detail.find(params[:id])
  @oreder_detail.update
  redirect_to action: "show", id:@order_detail
end

end
