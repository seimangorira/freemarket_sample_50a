class ItemsController < ApplicationController

  def index
  end

  def detail
  end
  
  def new
    @item = Item.new
    @parent_categories = Category.where(ancestry: nil)
  end

  def create
  end

  def buy
  end
end
