class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
     @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to action: "index"
  end

 


end