class ItemsController < ApplicationController
  # ユーザー登録機能作成後に、コメントアウトを外す
  # before_action :authenticate_user! except: [:index, :detail]

  def index
  end

  def detail
  end
  
  def new
    @item = Item.new
    @parent_categories = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
      redirect_to root_path
    else
      render :new
    end
  end

  def buy
  end

  def get_children_categories
    @children_categories = Category.where(ancestry: params[:parent_id])
  end

  def get_grandchildren_categories
    @grandchildren_categories = Category.find(params[:child_id]).children
  end

  private
  # salar_idは、ユーザー登録機能の完成後、current_user.idに修正
  def item_params
    params.require(:item).permit(
      :name, :introduction, :category_id, :size, :brand, :state, :delivery_fee, :delivery_method, :city, :delivery_days, :price, images: []
    ).merge(saler_id: User.find(1).id, status: 1)
  end
end
