class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

    def index
      @ladyitems = get_items(1)
      @menitems = get_items(2)
      @babyitems = get_items(3)
      @interioritems = get_items(4)
    end

private
  def get_items(id)
    category = Category.find(id)
    categories = category.indirect_ids
    items = Item.where(category_id: categories).order('id DESC').limit(4)
  end
end