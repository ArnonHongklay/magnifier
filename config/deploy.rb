# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'production'

set :scm, :git
set :repo_url, 'https://nonmadden:3618b7120d511b2c1aa28fe61f14c50023143694@github.com/nonmadden/production.git'
set :branch, 'master'

set :deploy_to, '/home/deployer/project/production'
set :deploy_user, 'deployer'
set :use_sudo, true

set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }

set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp vendor/bundle public/system}
set :tmp_dir, "#{fetch(:home)}/tmp"
set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }
set :keep_releases, 5
set :pty, true
set :format, :pretty

namespace :deploy do
  after :publishing, :restart
  after :finishing, 'deploy:cleanup'

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
        upload! StringIO.new(File.read("config/config.yml")), "#{shared_path}/config/config.yml"
    end
  end
end
