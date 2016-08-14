require 'active_support/concern'

module Bloggy
  module ControllerHelpers
    module User
      extend ActiveSupport::Concern

      included do
        helper_method :bloggy_current_user
      end

      private
      def bloggy_current_user
        @bloggy_current_user ||= Bloggy::User.find(session[:bloggy_user_id]) if session[:bloggy_user_id]
      end
    end
  end
end
