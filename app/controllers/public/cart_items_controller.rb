class Public::CartItemsController < ApplicationController
  def index

  @customer = Customer.find(current_customer.id)
  @cart_items = @customer.cart_items

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to action: "index"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
