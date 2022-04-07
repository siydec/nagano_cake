class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
    @customer.update(customer_params)
    redirect_to action: "show"
  end

  def unsubscribe
    @customer = current_customer

  end

  def withdraw
    @customer = current_customer
    @customer.update(customer_params)
    sign_out
    redirect_to public_root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation, :is_active )
  end

end
