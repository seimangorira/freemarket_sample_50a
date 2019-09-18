class ExhibitionsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @selling_items = Item.includes([:images_attachments, images_attachments: :blob]).where(seller_id: current_user.id, status: Item.statuses.values.slice(0)).order("created_at DESC")
  end

  def show
    @exhibitor = @item.seller
    @category = @item.category
  end
private
  def set_item
    @item = Item.includes([:images_attachments, images_attachments: :blob]).find(params[:id])
  end

end
