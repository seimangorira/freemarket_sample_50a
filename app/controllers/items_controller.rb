class ItemsController < ApplicationController
  # ユーザー登録機能作成後に、コメントアウトを外す
  # before_action :authenticate_user! except: [:index, :detail]
  before_action :set_parent_categories, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
  end

  def show
    @randItemLeft = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @randItemRight = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @exhibitor = @item.saler
    @otherExhibitorItems = @exhibitor.saling_items.where.not(id: @item.id).limit(6).order(created_at: "desc")
    @category = @item.category
    @otherCategorysItems = @category.items.where.not(id: @item.id).limit(6).order(created_at: "desc")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @selected_category = @item.category_id
    @children_categories = Category.find(@selected_category).parent.siblings
    @grandchildren_categories = Category.find(@selected_category).siblings
  end

  def update
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

  def set_parent_categories
    @parent_categories = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
