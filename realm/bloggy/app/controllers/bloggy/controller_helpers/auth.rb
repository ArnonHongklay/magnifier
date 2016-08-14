require 'active_support/concern'

module Bloggy
  module ControllerHelpers
    module Auth
      extend ActiveSupport::Concern
      include Bloggy::ControllerHelpers::User

      included do
        before_filter :authenticate_user!
      end

      private
      def authenticate_user!
         if bloggy_current_user.nil?
           redirect_to bloggy.admin_login_url, alert: I18n.t("bloggy.admin.login.need_auth")
         end
      end
    end
  end
end
