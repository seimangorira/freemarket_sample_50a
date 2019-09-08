class UsersController < ApplicationController

  def login
  end

  def logout
  end

  def show
  end

  def profile
  end

  def identification
  end

  def card
  end

  def addCard
  end

  def exhibiting
    items = Item.where(seller_id: current_user.id).includes(:seller).order("created_at DESC")
    @selling_items = items.where(status: 1)
  end

  private

  # def redirect_root
  #   if @user.id != current_user.id
  #     redirect_to root_path
  #   end
  # end

end
