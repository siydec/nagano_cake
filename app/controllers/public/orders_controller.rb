class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @customer = Customer.find(current_customer.id)

  end

  def confirm
    @order = Order.new(order_params)
    @customer = Customer.find(current_customer.id)
    @total = 0
    @cart_items = current_customer.cart_items


    if params[:order][:select_address] == "0"
      @order.delivery_address = @customer.address
      @order.delivery_postal_code = @customer.postal_code
      @order.delivery_name = @customer.last_name + @customer.first_name

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_address = @address.addresses
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_name = @address.name
    else params[:order][:select_address] == "3"


    end

  end

  def complete
  end


  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to "complete"
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:payment, :delivery_address, :delivery_postal_code, :delivery_name, :postage, :billing_amount)
  end
end
