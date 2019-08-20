class ItemsController < ApplicationController

  def index
  end

  def detail
    @item = Item.find(params[:id])
    @user = @item.saler
    @category = @item.category
  end
  
  def new
  end

  def buy
  end
end
