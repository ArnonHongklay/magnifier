class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    raise current_account.admin?.inspect
  end

  def settings
    # raise "xxxx"
  end

private
  def account_params
    params[:account_id]
  end
end
