class ItemsController < ApplicationController

  def index
  end

  def detail
    @item = Item.find(params[:id])
    @user = User.find(@item.saler_id)
    @category = Category.find(@item.category_id)
  end
  
  def new
  end

  def buy
  end
end
