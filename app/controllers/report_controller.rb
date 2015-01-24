class ReportController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    @pdf = "#{:account_report_show.to_s}"
  end

  def show
    @xxx = "xx,xxx,xxx,xxxx,xxx,xxx,xx"
    respond_to do |format|
      format.html
      format.csv do
        render text: @xxx.to_csv
      end
      format.xls do
        send_data @xxx.to_csv(col_sep: "\t")
      end
      format.pdf do
        render :pdf => "file_name",
        :template => 'report/show.html.erb',
        :layout => 'pdf',
        :header => {
          :right => "1"
        }
      end
    end
  end

private
  def account
    params[:account_id]
  end
end
