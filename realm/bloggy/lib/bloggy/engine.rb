require "truncate_html"
require "ckeditor"
require "select2-rails"
require "jquery-rails"
require "sass-rails"
require "coffee-rails"
require "responders"

module Bloggy
  class Engine < Rails::Engine
    isolate_namespace Bloggy
    engine_name 'bloggy'

    config.generators.test_framework :rspec, view_specs: false, fixture: false
    config.generators.stylesheets false
    config.generators.fixture_replacement :factory_girl
    config.generators.integration_tool :rspec

    initializer 'bloggy.assets.precompile' do |app|
      app.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
      app.config.assets.precompile += %w[
        bloggy/admin/ckeditor-config.js
        ckeditor/*
        *.eot* *.woff *.ttf
      ]
    end

    initializer 'bloggy.configuration', :before => :load_config_initializers do |app|
      app.config.bloggy = Bloggy::Configuration.new
      Bloggy::Config = app.config.bloggy
    end

    ENGINE_ROOT = File.join(File.dirname(__FILE__), '../..')
    require "#{ENGINE_ROOT}/deprecations"
  end
end
