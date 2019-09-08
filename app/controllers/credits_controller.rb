class CreditsController < ApplicationController

  def new
    
  end

  def create
    redirect_to complete_registration_path
  end

end
