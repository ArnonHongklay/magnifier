# config valid only for current version of Capistrano
lock '3.4.0'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'

set :application, 'production'
set :repo_url, 'git@github.com:ohmpieng/production.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/production'
set :deploy_user, 'deploy'
set :use_sudo, true

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :stages, ["staging", "production"]
set :default_stage, "production"

set :passenger_restart_with_touch, true

namespace :deploy do
  before :starting, :setup_config
  # after :publishing, :restart
  # after :finishing, 'deploy:cleanup'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Restart application'
    task :restart do
      on roles(:app), in: :sequence, wait: 5 do
        execute :touch, release_path.join('tmp/restart.txt')
    end
  end

#   desc 'Runs rake db:seed for SeedMigrations data'
#   task :seed => [:set_rails_env] do
#     on primary fetch(:migration_role) do
#       within release_path do
#         with rails_env: fetch(:rails_env) do
#           execute :rake, "db:seed"
#         end
#       end
#     end
#   end

#   after 'deploy:migrate', 'deploy:seed'

  desc "Database config"
    task :setup_config do
      on roles(:app), in: :sequence, wait: 5 do
        execute "mkdir -p #{shared_path}/config"
        execute "mkdir -p #{shared_path}/bin"
        execute "mkdir -p #{shared_path}/log"
        execute "mkdir -p #{shared_path}/tmp"
        execute "mkdir -p #{shared_path}/vendor/bundle"
        execute "mkdir -p #{shared_path}/public/system"
        upload! StringIO.new(File.read("config/database.yml")), "#{shared_path}/config/database.yml"
        upload! StringIO.new(File.read("config/secrets.yml")),  "#{shared_path}/config/secrets.yml"
    end
  end
end

# namespace :bower do
#   desc 'Install bower'
#   task :install do
#     on roles(:web) do
#       within release_path do
#         execute :rake, 'bower:install CI=true'
#       end
#     end
#   end
# end
# # before 'deploy:compile_assets', 'bower:install'
