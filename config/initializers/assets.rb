# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
# Rails.application.config.assets.initialize_on_precompile = true

Rails.application.root.join('vendor', 'assets', 'fonts', 'bower_components').to_s.tap do |bower_path|
  Rails.application.config.sass.load_paths << bower_path
  Rails.application.config.assets.paths << bower_path
end
Rails.application.config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/

Rails.application.config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

Rails.application.config.assets.precompile += %w( .css )
Rails.application.config.assets.precompile += %w( .js )
Rails.application.config.assets.precompile += %w( .png .jpg .jpeg .gif .woff .ttf .svg .eot )
