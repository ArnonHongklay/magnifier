class MonitoringToolsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_permissions
  layout 'accounts'

  def index
  end
end
