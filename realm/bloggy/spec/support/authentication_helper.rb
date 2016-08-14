module BloggySpecHelper
  module AuthenticationMock
    def sign_in_as user
      session[:bloggy_user_id] = user.id
    end
  end
end

RSpec.configure do |config|
  config.include BloggySpecHelper::AuthenticationMock, type: :controller
end
