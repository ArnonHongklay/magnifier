class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def info
    respond_to do |format|
      format.json
    end
  end

  def setting
    respond_to do |format|
      format.html
      format.json
    end
  end

  def profile

  end
end
