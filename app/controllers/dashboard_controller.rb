class DashboardController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_accounts!
  layout 'accounts'

  def index
    # HardWorker.perform_async('bob', 5)
  end

private
  def account
    params[:account_id]
  end
end
