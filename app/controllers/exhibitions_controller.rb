class ExhibitionsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]  #itemsテーブルの1つのアイテムを取得する処理。

  def index
    items = Item.where(seller_id: current_user.id).includes(:seller).order("created_at DESC")
    @selling_items = items.where(status: 1)
    # @items = Item.where(seller_id: current_user.id)  # itemsテーブルの、seller_idが現在ログインしているユーザーidのアイテムを取得する処理。
  end

  # def edit
      #itemsテーブルから取得したidが代入されている@itemのseller_idを取得する処理。
  #   @exhibitor = @item.seller

      #itemsテーブルのseller_idとuser_idが同じアイテムを新しく出品された順番で取得する処理。
  #   @otherExhibitorItems = @exhibitor.saling_items.order(created_at: "desc")

      #１つのitemのidからcategory_id(孫カテゴリーidを取得)を取得する処理。
  #   @category = @item.category

      #category_id(孫カテゴリーid)と自身が出品したitemを除いたitemを新しく出品された順で6こ取得する処理。
  #   @otherCategorysItems = @category.items.where.not(id: @item.id).limit(6).order(created_at: "desc")
  # end

  def show
    @exhibitor = @item.seller
    @category = @item.category
  end

  def destroy
    @item.destroy if @item.seller_id == current_user.id  #もしseller_idと現在ログインしているユーザーidが等しければ、@itemを消す。
    redirect_to root_path
  end

private
  def set_item
    @item = Item.find(params[:id])
  end

end
