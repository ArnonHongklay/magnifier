class PagesController < ApplicationController
  include HighVoltage::StaticPage
  caches_page :show
  skip_before_filter :authenticate_user!
  layout false
end
