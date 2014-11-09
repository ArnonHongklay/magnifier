source 'https://rubygems.org'
ruby '2.1.3'

gem 'rails', '4.1.5'                # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'railties'
gem 'mysql2'                        # Use mysql as the database for Active Record

gem 'sass-rails'                    # Use SCSS for stylesheets
gem "less-rails"
gem "bootstrap-sass"
gem 'uglifier'                      # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails'                  # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails'                  # Use jquery as the JavaScript library
gem 'jwt'
gem 'turbolinks'                    # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'            # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0',	group: :doc	# bundle exec rake doc:rails generates the API under doc/api.
gem 'bcrypt', '~> 3.1.7'            # Use ActiveModel has_secure_password
gem 'unicorn', '4.8.3'              # Use unicorn as the app server
gem 'bcrypt-ruby'                   # Secure password storing
gem 'execjs'
gem 'bootbox-rails', '~>0.4'

gem 'redis-namespace'               # Cleaner redis keys
gem 'redis-semaphore'               # Facebook access locking

gem 'koala'                         # Facebook
gem 'omniauth'                      # Authentication
gem 'omniauth-facebook'           	# Authentication strategy
gem 'cancan'                     		# Authorization

gem 'capistrano-ext'              # So developers and CircleCI can deploy
gem 'capistrano', '~> 3.1.0'       # So developers and CircleCI can deploy
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1' # Use Capistrano for deployment
gem 'capistrano-rbenv', github: "capistrano/rbenv"

group :development do
  gem 'puma'            # Multi-threaded server for development
  gem 'spring'          # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'foreman'         # Executes Procfile
  gem 'quiet_assets'    # For cleaner logs
  gem 'letter_opener'   # For easier mail testing
  gem 'guard-livereload', require: false # Live CSS reloading
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14'      # Testing engine
  gem 'rspec-its'                   # Rspec deprecated its
  gem 'rspec-collection_matchers'   # Rspec deprecated should
  gem 'byebug'
  gem 'machinist'                   # Fixtures, Blueprint
end

group :test do
  # gem 'sdoc', '0.4.0', require: false
  gem 'minitest'
  gem 'faker'                     # Fake data for fixtures
  gem 'mock_redis'                # Fake redis implemented in Ruby
  gem 'shoulda-matchers'          # Tests common Rails functionalities
  gem 'resque_spec'               # Tests job queueing
  gem 'database_cleaner'          # Resets database after each test
  gem 'simplecov', '~> 0.7.1', require: false # Keeps track of our test coverage
  gem 'capybara'                  # Integration testing
  gem 'hitimes'                   # Clock
  gem 'cliver'                    # Assertions for command-line dependencies
  gem 'poltergeist'               # Headless browser
  gem 'vcr'                       # Record and replay HTTP requests
  gem 'webmock'                   # For stubbing on HTTP requests
end

group :production do
	# See https://github.com/sstephenson/execjs#readme for more supported runtimes
	# gem 'therubyracer',  platforms: :ruby
  gem 'rails_12factor', '0.0.2'
  gem 'therubyracer'              # JavaScript compilation
  gem 'gibbon'                    # Mailchimp gem
  gem 'passenger'
end
