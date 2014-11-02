# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'production'
set :repo_url, 'https://nonmadden:3618b7120d511b2c1aa28fe61f14c50023143694@github.com/nonmadden/production.git'

set :deploy_to, '/home/deployer/project/production'
set :pty, true
set :format, :pretty
set :use_sudo, true
set :user, "deployer"
set :scm, :git
set :rails_env, 'production'
set :linked_files, %w{config/database.yml}
set :tmp_dir, "#{fetch(:home)}/tmp"
set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
  before "deploy:assets:precompile" do
    run [
      # "ln -nfs #{shared_path}/config/settings.yml #{release_path}/config/settings.yml",
      "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml",
      # "ln -fs #{shared_path}/uploads #{release_path}/uploads"
    ].join(" && ")
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

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

  desc "Symlink shared config files"
  task :symlink_config_files do
    run "ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end
end
