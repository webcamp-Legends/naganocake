class Public::ItemsController < ApplicationController
  def index
    @items_search = Item.where(is_active: true)
    @items = @items_search.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
