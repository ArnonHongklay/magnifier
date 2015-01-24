class DashboardController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_permissions
  layout 'accounts'

  def index
    # HardWorker.perform_async('bob', 5)
  end
end
