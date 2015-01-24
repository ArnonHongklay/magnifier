class ReportController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    @account = account
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "report",
        :template => 'report/index.html.erb',
        :layout => 'pdf',
        :header => {
          :right => "1"
        }
      end
    end
  end
end
