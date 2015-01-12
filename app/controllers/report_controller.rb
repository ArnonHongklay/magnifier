class ReportController < ApplicationController

  def index
  end

  def show
    # excel and csv
    # http://railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast

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
end
