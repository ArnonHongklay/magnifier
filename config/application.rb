require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ohmpieng
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Bangkok'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # I18n.enforce_available_locales = true
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    # config.enforce_available_locales = :th
    # config.i18n.default_locale = :th
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.version = '1.3' # Version of your assets, change this if you want to expire all your assets

    config.sass.preferred_syntax = :sass
    config.assets.precompile << '*.ttf' << '*.eot' << '*.svg' << '*.woff'
    config.assets.precompile << '*.png' << '*.jpg' << '*.gif'
    config.assets.initialize_on_precompile = false

    # Enable caching via the memory store
    config.cache_store = :memory_store
    config.session_store :encrypted_cookie_store

    ActiveRecord::SessionStore::Session.table_name = 'sessions'
    ActiveRecord::SessionStore::Session.primary_key = 'session_id'
    # ActiveRecord::SessionStore::Session.data_column_name = 'legacy_session_data'

    config.action_dispatch.default_headers.merge!({
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => '*'
    })
  end
end
