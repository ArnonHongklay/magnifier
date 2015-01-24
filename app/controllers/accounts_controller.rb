class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!

  def index
  end

  def settings
    # raise "xxxx"
  end
end
