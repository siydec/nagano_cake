class Public::RegistrationsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
   @customer = Customer.new(customer_params)
   @customer.save
  end

end
