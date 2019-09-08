class ExhibitionsController < ApplicationController

  def index
    items = Item.where(seller_id: current_user.id).includes(:seller).order("created_at DESC")
    @selling_items = items.where(status: 1)
  end

  def show
    @item = Item.find(params[:id])
    @exhibitor = @item.seller
    @category = @item.category
  end

end
