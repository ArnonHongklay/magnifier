
Rails.application do |config|
  config.assets.version = '1.0'
  config.assets.initialize_on_precompile = true
  config.assets.paths << Rails.root.join("vendor", "assets", "fonts", "bower_components")
  config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/
  config.assets.precompile += %w( .css )
  config.assets.precompile += %w( .js )
  config.assets.precompile += %w( .png .jpg .jpeg .gif .woff .ttf .svg .eot )
end
