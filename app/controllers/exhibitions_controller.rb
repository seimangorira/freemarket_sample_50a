class ExhibitionsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    items = Item.where(seller_id: current_user.id).includes(:seller).order("created_at DESC")
    @selling_items = items.where(status: 1)
  end

  def show
    @exhibitor = @item.seller
    @category = @item.category
  end

  def destroy
    @item.destroy if @item.seller_id == current_user.id
    redirect_to root_path
  end

private
  def set_item
    @item = Item.find(params[:id])
  end

end
