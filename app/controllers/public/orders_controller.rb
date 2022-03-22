class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @customer = Customer.find(current_customer.id)

  end

  def confirm
    @order = Order.new(order_params)
   binding.pry

  end

  def complete
  end

  def

  def create
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:payment)
  end
end
