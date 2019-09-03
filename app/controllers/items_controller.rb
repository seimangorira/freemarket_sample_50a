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
    @item_images = @item.images
    @upper__item_images = @item_images[0..4]
    @lower_item_images = @item_images[5..9]
    # 選択済みカテゴリーから、子カテゴリ・孫カテゴリ値を取得
    @children_categories = Category.find(@item.category_id).parent.siblings 
    @grandchildren_categories = Category.find(@item.category_id).siblings
  end

  def update
    # ユーザー機能の登録後、「1」をcurrent_user.idに変更
    @item.update(item_params) if @item.saler_id == 1
    redirect_to item_path(@item)
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
