class ItemsController < ApplicationController

  def detail
    @item = Item.find(params[:id])
  end
  
  def new
  end

  def buy
  end
end
