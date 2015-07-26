class ReportController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    @account = account
    respond_to do |format|
      format.html { render "accounts/report" }
      format.pdf do
        render pdf: "report",
               template: 'accounts/report_to_pdf.html.erb'
      end
    end
  end
end
