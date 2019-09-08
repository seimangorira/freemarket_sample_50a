class CreditsController < ApplicationController
  
  def index
    Payjp.api_key = PAYJP_SECRET_KEY
    customer = Payjp::Costomer.create(card: params[:payjp_token])
    @payment = Payment.new(user_id: current_user.id, card_token: params[:payjp_token])
    if @payment.save
      redirect_to root_path, notice: "カードの作成が完了しました"
    else
      redirect_to new_user_cregit_path
    end
  end

  def new
    
  end

  def create
    # redirect_to complete_registration_path
  end

  private
  def payment_params
    params.require(:credit)
  end

end
