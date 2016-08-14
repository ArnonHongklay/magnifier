source 'https://rubygems.org'
ruby '2.3.0'

# Engines
# gemspec path: 'realm/bloggy'
# gemspec path: 'palace'

gem 'rails', '4.2.5'
gem 'activerecord-session_store'

gem 'bcrypt'
gem 'turbolinks'
gem 'jquery-rails'
gem 'jbuilder'
gem 'compass-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'truncate_html'
gem 'select2-rails'
gem 'responders'

gem 'rails-i18n'

# Auth/users
gem 'devise'

gem 'koala', '~> 2.2'
gem 'omniauth-facebook'
gem 'kaminari'

gem 'sidekiq'

gem 'paperclip', git: 'git://github.com/thoughtbot/paperclip.git'

gem 'ckeditor'

group :development, :test do
  gem 'pry'
  # gem 'rspec-rails'
  # %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
  #   gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => 'master'
  # end
  # gem 'factory_girl_rails'
  # gem 'capybara'
  # gem 'capybara-webkit'
  # gem 'shoulda'
  # gem 'guard'
  # gem 'guard-rspec'
  # gem 'database_cleaner'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'

  # gem 'capistrano'
  # gem 'capistrano_colors'
  # gem 'quiet_assets'
  # gem 'guard-livereload', require: false
  # gem 'rack-livereload'
  # gem 'rb-fsevent', require: false

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', github: 'capistrano/rbenv'
  gem 'capistrano-rails-console'
end

platform :ruby do
  # gem 'mysql2', '>= 0.3.13', '< 0.5'
  gem 'pg'
  gem 'unicorn'
end

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk'
end
