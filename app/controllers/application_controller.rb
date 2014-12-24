class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :image]
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
