class DashboardController < ApplicationController
  def index
  	HardWorker.perform_async('bob', 5)
  end
end
