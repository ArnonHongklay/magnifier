
# Enable the asset pipeline
Rails.application.config.assets.enabled = true
Rails.application.config.assets.version = '1.3' # Version of your assets, change this if you want to expire all your assets
Rails.application.config.assets.initialize_on_precompile = false
Rails.application.config.sass.preferred_syntax = :sass

Rails.application.config.assets.debug = true

Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
Rails.application.config.assets.precompile += %w( *.css *.js )
Rails.application.config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif *.ico )
Rails.application.config.assets.precompile += %w( *.woff *.ttf *.svg *.eot )
