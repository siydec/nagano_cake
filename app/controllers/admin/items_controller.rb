class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to action: "index"
  end

  def show
    @item = Item.find(params[:id])

  end



  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to action: "show"
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active)

  end

end
