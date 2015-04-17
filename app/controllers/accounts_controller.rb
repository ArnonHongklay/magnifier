class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to account_index_path(current_account.name) }
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
