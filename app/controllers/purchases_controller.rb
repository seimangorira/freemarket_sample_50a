class PurchasesController < ApplicationController

  # 商品確認ページの表示
  def show
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    @credit = Credit.find(1)
    Payjp.api_key = ENV['PAYJP_SECRET_ACCESS_KEY']
    Payjp::Charge.create(currency: 'jpy', amount: 1000, customer: @credit.customer_id)
    redirect_to root_path
  end

end
