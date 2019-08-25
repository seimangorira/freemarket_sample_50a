class ItemsController < ApplicationController

  def index
  end

  def detail
  end
  
  def new
    @item = Item.new
    @parent_categories = Category.where(ancestry: nil)

    # 以下は仮実装のため、カテゴリーフォームを動的に作成する際に変更します。
    @child_categories = Category.where(ancestry: 1)
    @grandchild_categories = Category.find(14).children
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

  private
  # salar_idは、ユーザー登録機能の完成後、current_user.idに修正
  def item_params
    params.require(:item).permit(
      :name, :introduction, :category_id, :size, :brand, :state, :delivery_fee, :delivery_method, :city, :delivery_days, :price, images: []
    ).merge(saler_id: User.find(1).id, status: 1)
  end
end
