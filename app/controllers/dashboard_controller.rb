class DashboardController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    HardWorker.perform_async('bob', 5)

    render "accounts/dashboard"
  end
end
