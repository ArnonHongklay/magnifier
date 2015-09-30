source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.4'
gem 'mysql2'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'

gem 'nprogress-rails'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'angular-rails-templates'

gem 'autoprefixer-rails', '5.0.0.3'  # CSS auto-prefixing
gem "compass-rails", github: 'Compass/compass-rails' # CSS helper
gem "sprockets"

gem 'nokogiri'
# gem 'activeadmin',                github: 'activeadmin'
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
gem 'activeresource',             github: 'rails/activeresource'
gem "activerecord-deprecated_finders", "~> 1.0.3"
gem "actionpack-action_caching"
gem "actionpack-page_caching"

# static page
gem 'high_voltage'

gem 'cancan'                            # => Authorization
gem 'devise'                            # => Authorization
gem 'koala'                             # => Facebook
gem 'twitter'                           # => Twitter
gem 'omniauth'                          # => Authentication
gem 'omniauth-facebook'                 # => Authentication Facebook
gem 'omniauth-twitter'                  # => Authentication Twitter

gem 'sinatra'
gem 'sidekiq'
gem 'sidekiq-failures'
gem "sidekiq-cron"

gem 'redis'
gem 'smarter_csv'
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'puma'                            # => Multi-threaded server for development
  gem 'foreman'                         # => Executes Procfile
  gem 'capistrano'                      # => So developers and CircleCI can deploy
  gem 'capistrano-ext'                  # => So developers and CircleCI can deploy
  gem 'capistrano-rails'                # =>  Use Capistrano for deployment
  gem 'capistrano-rbenv',               github: "capistrano/rbenv"
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'

  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'rspec-rails'               # => Testing engine
  gem 'rspec-its'                 # => Rspec deprecated its
  gem 'rspec-collection_matchers' # => Rspec deprecated should
end

group :production do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer',  platforms: :ruby
  gem 'passenger'
  # Use unicorn as the app server
  # gem 'unicorn'
end
