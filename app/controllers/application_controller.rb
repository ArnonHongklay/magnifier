class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def verify_permissions
    not_found if not current_account.admin? and account != current_account.name
    not_found if current_account.admin? and Account.find_by_name(account).nil?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
