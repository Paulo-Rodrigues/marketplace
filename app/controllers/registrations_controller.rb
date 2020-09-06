class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:update]
  
  protected

  def after_sign_up_path_for(user)
    profile_path(user)
  end

  def after_update_path_for(user)
    profile_path(user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :department, :avatar, :password, :email ])
  end
end
