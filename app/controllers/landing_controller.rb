class LandingController < ApplicationController
  def index
    if account_signed_in?
      if current_account.name.empty?
        redirect_to profile_path
      else
        redirect_to account_index_path(current_account.name)
      end
    end
  end
end
