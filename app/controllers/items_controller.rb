class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_parent_categories, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_saved_images, only: [:edit, :update]
  before_action :set_children_and_grandchildren_categories, only: [:edit, :update]
  before_action :seller_equal_current_user?, only: [:edit, :update]

  def index
  end

  def show
    @item = Item.includes([:images_attachments, images_attachments: :blob]).find(params[:id])
    @randItemLeft = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @randItemRight = Item.where("id>=?", rand(Item.first.id..Item.last.id)).first
    @exhibitor = @item.seller
    @otherExhibitorItems = @exhibitor.saling_items.includes([:images_attachments, images_attachments: :blob]).where.not(id: @item.id).limit(6).order(created_at: "desc")
    @category = @item.category
    @otherCategorysItems = @category.items.includes([:images_attachments, images_attachments: :blob]).where.not(id: @item.id).limit(6).order(created_at: "desc")
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
  end

  def update
    if @item.update(item_params) 
      remove_item_images
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def buy
  end

  def destroy
    if @item.seller_id == current_user.id
      @item.destroy 
      redirect_to root_path
    else
      redirect_to exhibitions_path
    end
  end

  def search
    @value = params[:search]
    if @value.present?
      @search = Item.includes([:images_attachments, images_attachments: :blob]).where("name LIKE?", "%#{@value}%")
      @new_items = Item.includes([:images_attachments, images_attachments: :blob]).order('id DESC')
    else
      @search = Item.includes([:images_attachments, images_attachments: :blob]).order('id DESC')
    end
  end

  def get_children_categories
    @children_categories = Category.where(ancestry: params[:parent_id])
  end

  def get_grandchildren_categories
    @grandchildren_categories = Category.find(params[:child_id]).children
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :introduction, :category_id, :size, :brand, :state, :delivery_fee, :delivery_method, :city, :delivery_days, :price, images: [], image_ids: []
    ).merge(seller_id: current_user.id, status: 1)
  end

  def set_parent_categories
    @parent_categories = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_saved_images
    @item_images = @item.images
    @upper_item_images = @item_images[0..4]
    @lower_item_images = @item_images[5..9]
  end

  def set_children_and_grandchildren_categories
    # 保存済みカテゴリーから、子カテゴリ・孫カテゴリ値を取得
    @children_categories = Category.find(@item.category_id).parent.siblings 
    @grandchildren_categories = Category.find(@item.category_id).siblings
  end

  def remove_item_images
    if params[:item][:image_ids].present?
      params[:item][:image_ids].each do |image_id|
        unless image_id == "0"
          image = @item.images.find(image_id) 
          image.purge
        end
      end
    end
  end

  def seller_equal_current_user?
    redirect_to root_path unless @item.seller_id == current_user.id
  end

end
