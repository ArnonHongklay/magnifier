require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.2'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
