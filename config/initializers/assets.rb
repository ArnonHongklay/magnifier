
Rails.application do |config|
  config.assets.initialize_on_precompile = false
  config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
  config.assets.precompile = [/^[a-z0-9\/]*[a-z0-9]\w+.(css|js)$/]
  config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif *.ico )
  config.assets.precompile += %w( *.woff *.ttf *.svg *.eot )
end
# Rails.application.config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/
