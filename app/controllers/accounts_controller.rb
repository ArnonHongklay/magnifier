class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!

  def index
    # raise redis.inspect
    redis.set("mykey", "hello world")
    x = redis.get("mykey")

    # raise x.inspect

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
