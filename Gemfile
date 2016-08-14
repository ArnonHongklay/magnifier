source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'nprogress-rails'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'angular-rails-templates'

# gem 'autoprefixer-rails', '5.0.0.3'  # CSS auto-prefixing
gem "compass-rails", github: 'Compass/compass-rails' # CSS helper
# gem "sprockets"

gem 'nokogiri'
# gem 'activeadmin',                github: 'activeadmin'
# gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
# gem 'activeresource',             github: 'rails/activeresource'
# gem "activerecord-deprecated_finders", "~> 1.0.3"
# gem "actionpack-action_caching"
# gem "actionpack-page_caching"

# static page
gem 'high_voltage'

gem 'cancan'                            # => Authorization
gem 'devise'                            # => Authorization
gem 'koala'                             # => Facebook
gem 'twitter'                           # => Twitter
gem 'omniauth'                          # => Authentication
gem 'omniauth-facebook'                 # => Authentication Facebook
gem 'omniauth-twitter'                  # => Authentication Twitter

gem 'rack-protection', github: 'sinatra/rack-protection'
gem 'sinatra', github: 'sinatra'
gem 'sidekiq'
gem 'sidekiq-failures'
gem "sidekiq-cron"

gem 'redis'
gem 'smarter_csv'
gem 'wkhtmltopdf-binary-edge'
gem 'wicked_pdf'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'               # => Testing engine
  gem 'rspec-its'                 # => Rspec deprecated its
  gem 'rspec-collection_matchers' # => Rspec deprecated should
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv', github: 'capistrano/rbenv'
  gem 'capistrano-rails-console'
  # gem 'capistrano-passenger'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
