class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @customer = Customer.find(current_customer.id)

  end

  def confirm
    @order = Order.new(order_params)
    @customer = Customer.find(current_customer.id)
    @cart_items = current_customer.cart_items
    if params[:order][:select_address] == "0"
      @order.delivery_address = @customer.address
      @order.delivery_postal_code = @customer.postal_code
      @order.delivery_name = @customer.last_name + @customer.first_name
    elsif params[:order][:select_adress] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_address = @address.addresses
      @order.delivery_postal_code = @address.postalcode
      @order.delivery_name = @address.name
    else
      redirect_to "/public"
    end

  end

  def complete
  end


  def create
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.permit(:payment, :delivery_address, :delivery_postal_code, :delivery_name, :select_address)
  end
end
