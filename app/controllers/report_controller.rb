class ReportController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    @account = current_account
    @servers = @account.servers

    respond_to do |format|
      format.json { render "accounts/report" }
      format.html { render "accounts/report" }
      format.pdf do
        render pdf: "report",
               template: 'accounts/report_to_pdf.html.erb'
      end
    end
  end
end
