source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'nokogiri'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
gem 'activeresource', github: 'rails/activeresource'
gem "activerecord-deprecated_finders", "~> 1.0.3"
gem "actionpack-action_caching"
gem "actionpack-page_caching"

gem 'activeadmin', github: 'activeadmin'

# static page
gem 'high_voltage'
# bundle
gem 'bower-rails'

# javascript
gem 'angular-rails-templates'
gem 'coffee-rails', github: 'rails/coffee-rails'
gem 'nprogress-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# stylesheet
gem 'sass-rails'
# gem 'bootstrap-sass'
gem 'bootstrap-sass'
gem "font-awesome-rails"

gem 'autoprefixer-rails', '5.0.0.3'  # CSS auto-prefixing
gem "compass-rails", github: 'Compass/compass-rails' # CSS helper
gem 'sprockets-rails', require: 'sprockets/railtie'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0' # Minification

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

gem 'wicked_pdf'  # pdf

# gem 'strong_parameters'
gem 'cancan'                        # Authorization
gem 'devise'                        # Authorization
gem 'koala'                         # Facebook
gem 'twitter'                       # Twitter
gem 'omniauth'                      # Authentication
gem 'omniauth-facebook'             # Authentication Facebook
gem 'omniauth-twitter'              # Authentication Twitter

gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra', :require => nil

gem 'redis'
# gem 'redis-namespace'               # Cleaner redis keys
# gem 'redis-semaphore'               # Facebook access locking

gem 'websocket-rails'
# gem 'tubesock'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development do
  gem 'puma'                      # Multi-threaded server for development
  gem 'foreman'                   # Executes Procfile

  gem 'capistrano-ext'              # So developers and CircleCI can deploy
  gem 'capistrano', '~> 3.1.0'       # So developers and CircleCI can deploy
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1.1' # Use Capistrano for deployment
  gem 'capistrano-rbenv', github: "capistrano/rbenv"
  gem 'capistrano-bower'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  # test
  gem 'rspec-rails'               # Testing engine
  gem 'rspec-its'                 # Rspec deprecated its
  gem 'rspec-collection_matchers' # Rspec deprecated should

end

group :production do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer',  platforms: :ruby
  gem 'passenger'

  # Use unicorn as the app server
  # gem 'unicorn'
end

