
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
# require 'capistrano/bower'

# require 'capistrano/rbenv'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.5'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
