class LandingController < ApplicationController
  def index
    if account_signed_in?
      redirect_to account_index_path(current_account.name)
    end
  end
end
