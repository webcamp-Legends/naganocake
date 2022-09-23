class Public::HomesController < ApplicationController
  def top
    @items_search = Item.where(is_active: true)
    @items = @items_search.order("created_at DESC").limit(4)
    @genres = Genre.all
  end

  def about
  end
end
