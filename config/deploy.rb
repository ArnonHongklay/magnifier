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

  # run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  desc "Symlink shared config files"
  task :linked_files do
    next unless any? :linked_files
    on roles :app do
      execute :mkdir, '-pv', linked_file_dirs(release_path)
      fetch(:linked_files).each do |file|
        target = release_path.join(file)
        source = shared_path.join(file)
        unless test "[ -L #{target} ]"
          if test "[ -f #{target} ]"
            execute :rm, target
          end
          execute :ln, '-s', source, target
        end
      end
    end
  end

  desc 'Check files to be linked exist in shared'
  task :linked_files do
    next unless any? :linked_files
    on roles :app do |host|
      linked_files(shared_path).each do |file|
        unless test "[ -f #{file} ]"
          error t(:linked_file_does_not_exist, file: file, host: host)
          exit 1
        end
      end
    end
  end
end
