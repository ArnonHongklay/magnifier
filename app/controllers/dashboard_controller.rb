class DashboardController < ApplicationController
  # include Tubesock::Hijack
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    HardWorker.perform_async('bob', 5)

    # hijack do |tubesock|
    #   tubesock.onopen do
    #     tubesock.send_data "Hello, friend"
    #   end
    # end
    render "accounts/dashboard"
  end
end
