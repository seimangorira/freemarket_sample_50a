class ItemsController < ApplicationController

  def index
  end

  def detail
    @item = Item.find(params[:id])
    @randItem = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @randItemSecond = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @user = @item.saler
    @items = @user.saling_items.limit(6).order(created_at: "desc")
    @category = @item.category
    @categorys = @category.items.limit(6).order(created_at: "desc")
  end
  
  def new
  end

  def buy
  end
end
