class PurchasesController < ApplicationController
  before_action :set_item, only: [:show, :update]

  # 商品確認ページの表示
  def show
    redirect_to root_path if @item.seller_id == current_user.id
  end

  def update
    if current_user.credit.present?
      @credit = current_user.credit
      Payjp.api_key = ENV['PAYJP_SECRET_ACCESS_KEY']
      Payjp::Charge.create(currency: 'jpy', amount: @item.price, customer: @credit.customer_id)
      @item.update(status: 4, buyer_id: current_user.id)
      redirect_to root_path, notice: "購入が完了しました"
    else
      redirect_to root_path
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
