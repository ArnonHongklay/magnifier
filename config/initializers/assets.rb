# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
# Rails.application.config.assets.initialize_on_precompile = true

Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts', 'bower_components')
Rails.application.config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/

Rails.application.config.assets.precompile += %w( .css )
Rails.application.config.assets.precompile += %w( .js )
Rails.application.config.assets.precompile += %w( .png .jpg .jpeg .gif .woff .ttf .svg .eot )
Rails.application.config.assets.precompile += %w( .map )

# Rails.application.config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff)$)
# ::Sass::Script::Number.precision = [10, ::Sass::Script::Number.precision].max
