class AdminsController < ApplicationController

  before_action :restrict_to_admin, only: [:index]

  def index
    
  end

  def edit_permissions
    @users = User.all
  end

  def update_permissions
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:user][:role] == "admin"
        @user.role = "admin"
      else
        @user.role = "normal"
      end
    end
    @user.save
    redirect_to :edit_permissions
  end

  private
  
  def user_params
    params.require(:user).permit(:role)
  end

  def restrict_to_admin
    if current_user.role != "admin"
      redirect_to products_path
    end
  end

end
