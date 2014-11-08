# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.3'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.enabled = true

Rails.application.config.assets.prefix = '/apps/assets/'
Rails.application.config.assets.paths << Rails.root.join("lib", "videoplayer", "flash")

Rails.application.config.assets.precompile << '*.ttf' << '*.eot' << '*.svg' << '*.woff'
Rails.application.config.assets.precompile << '*.png' << '*.jpg' << '*.gif'

Rails.application.config.assets.precompile += %w( *.js )
