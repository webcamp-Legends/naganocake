class SearchesController < ApplicationController
  def search
    @items = Item.search( params[:word])
    @word = params[:word]
  end
end
