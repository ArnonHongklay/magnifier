class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  skip_before_filter :verify_authenticity_token, :only => [:setting_update]

  def index
    # raise redis.inspect
    # redis.set("mykey", "hello world")
    # x = redis.get("mykey")

    # raise x.inspect

    @account = current_account

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @account = current_account

    respond_to do |format|
      format.html { redirect_to account_index_path(current_account.name) }
      format.json
    end
  end

  def setting
    @account = current_account
    respond_to do |format|
      format.html
      format.json
    end
  end

  def setting_update
    # raise params[:ip].inspect
    account_id = Account.where(name: 'geek').first.id
    Account.find(account_id).servers.create(ip_address: params[:ip])
  end

  # def profile
  #   # respond_to do |format|
  #   #   format.html
  #   #   format.json
  #   # end
  #   # raise current_account.inspect
  # end
end
