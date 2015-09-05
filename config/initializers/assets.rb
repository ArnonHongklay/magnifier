Rails.application.configure do

  # Enable the asset pipeline
  config.assets.enabled = true
  config.assets.version = '1.1' # Version of your assets, change this if you want to expire all your assets
  config.assets.initialize_on_precompile = false
  config.sass.preferred_syntax = :sass
  config.sass.line_comments = false
  config.sass.cache = false

  config.assets.debug = true

  config.assets.paths << Rails.root.join('components')
  config.assets.precompile += %w( *.css *.js )
  config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif *.ico )
  config.assets.precompile += %w( *.woff *.ttf *.svg *.eot )
  # config.assets.precompile << /\A(?!active_admin).*\.(js|css)\z/
end
