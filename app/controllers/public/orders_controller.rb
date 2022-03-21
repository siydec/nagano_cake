class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @customer = Customer.find(current_customer.id)

  end

  def confirm
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @cart_items = current_customer.cart_items
    if @order.select_address == "0"
    elsif @order.payment == "1"
    elsif @order.payment == "2"
    end

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
end
