class AdminsController < ApplicationController

  before_action :restrict_to_admin, only: [:index]

  def index
    
  end

  private

  def restrict_to_admin
    if current_user.role != "admin"
      redirect_to products_path
    end
  end

end
