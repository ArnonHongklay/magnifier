source 'https://rubygems.org'
ruby '2.2.0'

# gem 'net-ssh', '~> 2.8.1', :git => "https://github.com/net-ssh/net-ssh"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem "resque", "~> 2.0.0.pre.1", github: "resque/resque"

# javascript
gem 'jquery-rails'
gem 'coffee-rails', github: 'rails/coffee-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# stylesheet
gem 'sass-rails', github: 'rails/sass-rails'
gem 'font-awesome-sass'
gem "compass-rails", github: 'Compass/compass-rails' # CSS helper
gem 'autoprefixer-rails'  # CSS auto-prefixing
gem 'sprockets-rails', require: 'sprockets/railtie'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0' # Minification

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'wicked_pdf'  # pdf

gem 'cancan'                     		# Authorization
gem 'devise'                     		# Authorization
gem 'koala'                         # Facebook
gem 'omniauth'                      # Authentication
gem 'omniauth-facebook'           	# Authentication Facebook
gem 'omniauth-twitter'              # Authentication Facebook

gem 'sidekiq'
gem 'sidekiq-failures'

gem 'redis-namespace'               # Cleaner redis keys
gem 'redis-semaphore'               # Facebook access locking

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'puma'                      # Multi-threaded server for development
  gem 'foreman'                   # Executes Procfile
  gem 'capistrano-ext'              # So developers and CircleCI can deploy
  gem 'capistrano', '~> 3.1.0'       # So developers and CircleCI can deploy
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1.1' # Use Capistrano for deployment
  gem 'capistrano-rbenv', github: "capistrano/rbenv"

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer',  platforms: :ruby
  gem 'passenger'

  # Use unicorn as the app server
  # gem 'unicorn'
end
