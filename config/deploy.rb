
set :rbenv_type, :user
set :rbenv_ruby, '2.1.2p95'

# bundler
set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_dir, -> { shared_path.join('bundle') }
set :bundle_flags, '--deployment --quiet'
set :bundle_without, %w{development test}.join(' ')
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_roles, :all

# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'production'
set :repo_url, 'git@bitbucket.org:arnononline/production.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/deploy'
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
  after :finishing, 'deploy:cleanup'

  # after :restart, :clear_cache do
    # on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    # end
  # end

end
