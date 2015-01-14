set :stage, :staging
set :rails_env, :production

role :app, %w{deployer@staging.ohmpieng.org}
role :web, %w{deployer@staging.ohmpieng.org}
role :db,  %w{deployer@staging.ohmpieng.org}

server 'staging.ohmpieng.org',
  user: 'deployer',
  roles: %w{web app db},
  primary: true,
  my_property: :my_value,
  ssh_options: {
    user: 'deployer', # overrides user setting above
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
    # password: 'please use keys'
  }