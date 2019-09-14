class PurchasesController < ApplicationController

  # 商品確認ページの表示
  def show
    @item = Item.find(params[:id])

  end

end
