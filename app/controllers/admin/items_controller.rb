class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      redirect_to  new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
