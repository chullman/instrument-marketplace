class RegistrationsController < Devise::RegistrationsController
  
  # Extending the Devise Reistrations Controller to permit the new username, first_name, and last_name fields

  private

  def sign_up_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation, :current_password)
  end
end