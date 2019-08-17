class ItemsController < ApplicationController

  def index
  end

  def detail
    @item = Item.find(params[:id])
  end
  
  def new
  end

  def buy
  end
end
