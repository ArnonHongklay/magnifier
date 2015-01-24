class DashboardController < ApplicationController
  layout 'accounts'

  def index
    # HardWorker.perform_async('bob', 5)
  end
end
