require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Production
  class Application < Rails::Application

    config.autoload_paths += %W(#{config.root}/lib)

    config.time_zone = 'Bangkok'
    config.i18n.default_locale = :th
    config.encoding = "utf-8"
    config.active_support.escape_html_entities_in_json = true

    config.assets.enabled = true
    config.assets.version = '1.3'

    config.cache_store = :memory_store

    I18n.enforce_available_locales = false

    config.generators do |g|
      g.javascripts false
    end

    config.to_prepare do
      # Use helpers in ActionMailer templates
      ActionMailer::Base.helper :application
    end

  end
end
