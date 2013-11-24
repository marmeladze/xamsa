class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  ensure_security_headers # See more: https://github.com/twitter/secureheaders

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :full_name
    devise_parameter_sanitizer.for(:sign_up) << :birthday
    devise_parameter_sanitizer.for(:sign_up) << :sex
  end

  def after_sign_in_path_for(resource)
    games_path
  end
end
