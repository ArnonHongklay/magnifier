# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.3'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.enabled = true

Rails.application.config.assets.prefix = '/apps/assets/'
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
Rails.application.config.assets.precompile << '*.png' << '*.jpg' << '*.gif'
Rails.application.config.assets.precompile += %w( *.js )
#
# root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
#   Rails.application.config.sass.load_paths << bower_path
#   Rails.application.config.assets.paths << bower_path
# end
#
# # Precompile Bootstrap fonts
# Rails.application.config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff)$)
# # Minimum Sass number precision required by bootstrap-sass
# ::Sass::Script::Number.precision = [10, ::Sass::Script::Number.precision].max
