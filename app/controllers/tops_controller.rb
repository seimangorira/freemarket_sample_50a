class TopsController < ApplicationController
  before_action :set_parent_categories
  before_action :set_children_categories
  before_action :set_grandchildren_categories

  def index
    @ladyitems = get_items(1)
    @menitems = get_items(2)
    @babyitems = get_items(3)
    @interioritems = get_items(4)
  end

  def get_children_categories
    # binding.pry
    @children_categories = Category.where(ancestry: params[:parent_id]).limit(14)
  end

  def get_grandchildren_categories
    # binding.pry
    @grandchildren_categories = Category.find(params[:child_id]).children
  end

private

  def set_parent_categories
    # binding.pry
    @parent_categories = Category.where(ancestry: nil)
  end

  def set_children_categories
    # binding.pry
    @children_categories = Category.where(ancestry: params[:parent_id])
  end

  def set_grandchildren_categories
    # @grandchildren_categories = Category.find(params[:child_id]).children
  end

  def get_items(id)
    category = Category.find(id)
    categories = category.indirect_ids
    items = Item.where(category_id: categories).order('id DESC').limit(4)
  end

end