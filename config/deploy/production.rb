set :stage, :production
set :rails_env, :production

role :app, %w{deployer@ohmpieng.io}
role :web, %w{deployer@ohmpieng.io}
role :db,  %w{deployer@ohmpieng.io}

server 'ohmpieng.io',
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
