class CreditsController < ApplicationController

  def new
    # @address = Address.new
  end

  def create
    redirect_to complete_registration_path
  end

end
