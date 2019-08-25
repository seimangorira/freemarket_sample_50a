class ItemsController < ApplicationController

  def index
  end

  def show
    @detailItem = Item.find(params[:id])
    @randItemLeft = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @randItemRight = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @exhibitor = @detailItem.saler
    @oetherExhibitorItems = @exhibitor.saling_items.limit(6).order(created_at: "desc")
    @category = @detailItem.category
    @otherCategorysItems = @category.items.limit(6).order(created_at: "desc")
  end
  
  def new
  end

  def buy
  end
end
