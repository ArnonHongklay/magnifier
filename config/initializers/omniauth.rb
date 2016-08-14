Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "380204622150098", "61fefb9f71dc1abf558eff1e4a013810",
           scope: 'email,user_birthday,read_stream', display: 'popup'
end
