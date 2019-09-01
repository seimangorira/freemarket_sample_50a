class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save 
      redirect_to credit_new_registration_path(current_user)
    else
      render :new
    end
  end

end
