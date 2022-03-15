class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer[:id])
  end

  def edit
    @customer = Customer.find(current_customer[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to action: "show"
  end

  def unsubscribe
    @customer = Customer.find(current_customer[:id])
  end

  def withdraw
    @customer = Customer.find(current_customer[:id])
    @customer.update(customer_params)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation, :is_active )
  end

end
