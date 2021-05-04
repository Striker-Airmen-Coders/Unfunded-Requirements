class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  def current_office
    current_user.try(:office)
  end

  def to_bool(string)
    string == "Yes" ? true : false 
  end

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:office_id])
  end
end
