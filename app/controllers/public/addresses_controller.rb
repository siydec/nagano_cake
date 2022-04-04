class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]

  def index
   @address = Address.new
   @addresses = Address.where(customer_id: current_customer.id)


  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
   if @address.save
      redirect_to action: "index"
   else
   @address = Address.new
   @addresses = Address.all
   render action: "index"
   end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to action: "index"
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to action: "index"
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :addresses, :name, :customer_id)
  end

end
