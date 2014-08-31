class LandingController < ApplicationController
  protect_from_forgery with: :exception
  layout 'landing'

  def index
  end
end
