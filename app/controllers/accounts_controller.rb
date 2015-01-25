class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def setting
    # raise "xxxx"

    respond_to do |format|
      format.html
      format.json
    end
  end
end
