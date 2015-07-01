
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.initialize_on_precompile = false
Rails.application do |config|
  config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

  # config.assets.precompile += [/(^[^_\/]|\/[^_])[^\/]*$/]
  config.assets.precompile = [/^[a-z0-9\/]*[a-z0-9]\w+.(css|js)$/]
  config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif *.ico )
  config.assets.precompile += %w( *.woff *.ttf *.svg *.eot )


end
# Rails.application.config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/

# Rails.application.config.assets.precompile << /\A(?!active_admin).*\.(js|css)\z/
# Rails.application.config.assets.precompile += %w( *.css )
# Rails.application.config.assets.precompile += %w( *.js )
