class TopsController < ApplicationController
  before_action :set_child_categories
  before_action :set_grandchild_categories
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @ladyitems = get_items(1)
    @menitems = get_items(2)
    @babyitems = get_items(3)
    @interioritems = get_items(4)
  end

  def get_child_categories
    @child_categories = Category.where(ancestry: params[:parent_id]).limit(14)
  end

  def get_grandchild_categories
    @grandchild_categories = Category.find(params[:child_id]).children
    # binding.pry
  end

private

  # def set_parent_categories
  #   @parent_categories = Category.where(ancestry: nil)
  # end

  def set_child_categories
    @children_categories = Category.where(ancestry: params[:parent_id])
  end

  def set_grandchild_categories
    # @grandchildren_categories = Category.find(params[:child_id]).children
  end

  def get_items(id)
    category = Category.find(id)
    categories = category.indirect_ids
    items = Item.includes([:images_attachments, images_attachments: :blob]).where(category_id: categories).order('id DESC').limit(4)
  end

end