class ItemsController < ApplicationController

  def index
  end

  def detail
    @item = Item.find(params[:id])
    @randItem = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @randItemSecond = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @user = @item.saler
    @category = @item.category
  end
  
  def new
  end

  def buy
  end
end
