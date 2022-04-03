class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top, :about]
  
  def index

  @customer = Customer.find(current_customer.id)
  @cart_items = @customer.cart_items
  @total = 0


  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to action: "index"
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to action: "index"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to action: "index"
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
