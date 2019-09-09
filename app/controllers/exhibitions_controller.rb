class ExhibitionsController < ApplicationController

  def index
    @selling_items = Item.where(seller_id: current_user.id, status: 1).includes(:seller).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @exhibitor = @item.seller
    @category = @item.category
  end

end
