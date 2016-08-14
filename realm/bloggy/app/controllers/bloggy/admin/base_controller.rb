class Bloggy::Admin::BaseController < Bloggy::ApplicationController
  include Bloggy::ControllerHelpers::Auth
  force_ssl if Bloggy::Config.admin_force_ssl # TODO: find a way to test that with capybara

  layout "layouts/bloggy/admin"
end
