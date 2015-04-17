class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

protected
  def layout_by_resource
    if devise_controller?
      "auth"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def verify_account!
    # not_found if not current_account.admin? and account != current_account.name
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

private
  def account
    params[:account_id]
  end
end
