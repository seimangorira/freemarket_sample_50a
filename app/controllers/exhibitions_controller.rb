class ExhibitionsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @selling_items = Item.where(seller_id: current_user.id, status: 1).includes(:seller).order("created_at DESC")
  end

  def show
    @exhibitor = @item.seller
    @category = @item.category
  end
private
  def set_item
    @item = Item.find(params[:id])
  end

end
