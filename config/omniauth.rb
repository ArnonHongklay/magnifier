Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, "v9534vsjxeRfyScU6okJU17eK", "u5OOeQh8TSr6Tf2WdhmAxOY9tDLOncSFpEFXCBzrFiltr0G2bd"
  provider :facebook, "1435086240088594", "21f6da16770ef8c55d6a231db48a5ed4"
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   on_failure { |env| AuthenticationsController.action(:failure).call(env) }
# end

# config.omniauth :facebook, "1435086240088594", "21f6da16770ef8c55d6a231db48a5ed4",
# scope: 'email,manage_pages,read_page_mailboxes,read_insights,publish_stream,manage_notifications', display: 'popup'
#
# config.omniauth :twitter, "v9534vsjxeRfyScU6okJU17eK", "u5OOeQh8TSr6Tf2WdhmAxOY9tDLOncSFpEFXCBzrFiltr0G2bd",
# {
#   :secure_image_url => 'true',
#   :image_size => 'original',
#   :authorize_params => {
#     :force_login => 'true',
#     :lang => 'pt'
#   }
# }
