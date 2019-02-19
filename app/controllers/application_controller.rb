class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def after_sign_up_path_for(resource)
  #   edit_user_path(current_user.id)
  # end

  # def after_sign_in_path_for(resource)
  #   if current_user.asset.present?
  #     user_path(current_user.id)
  #   else
  #     edit_user_path(current_user.id)
  #   end
  # end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction])
  end
end
