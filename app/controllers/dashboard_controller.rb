class DashboardController < ApplicationController
  include ActionController::Live

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

  def events
    response.headers['Content-Type'] = 'text/event-stream'
    3.times do |n|
      response.stream.write "xxxxx \n"
      sleep 1
    end
  rescue
    logger.info "stream closed"
  ensure
    response.stream.close
  end
end
