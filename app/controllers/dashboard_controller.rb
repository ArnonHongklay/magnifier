class DashboardController < ApplicationController
  # include Tubesock::Hijack
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    @account = current_account

    respond_to do |format|
      format.html { render "accounts/dashboard" }
      format.json { render "accounts/dashboard" }
    end
  end
end
