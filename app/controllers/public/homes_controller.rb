class Public::HomesController < ApplicationController

before_action :authenticate_customer!, except: [:top, :about]

  def top
    @items = Item.all.order(id: "DESC")


  end

  def about
   #  @customer = Customer.find(current_public_customer[:id])
  end

end
