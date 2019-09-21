class CreditsController < ApplicationController
  
  def index

  end

  def new
    
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_ACCESS_KEY"]
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @credit = Credit.new(user_id: current_user.id, card_token: params[:payjpToken], customer_id: customer.id)
    if @credit.save
      redirect_to root_path, notice: "カードの作成が完了しました"
    else
      redirect_to new_user_cregit_path
    end
  end

end
