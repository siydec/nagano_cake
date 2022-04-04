class Admin::ItemsController < ApplicationController



  def index
    @items = Item.all
    @genre = Genre.all



  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: "show", id: @item
    else
     @item = Item.new
     @genre = Genre.all
     render action: "new"

    end

  end

  def show
    @item = Item.find(params[:id])

  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end





  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to action: "show"
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id)

  end

end
