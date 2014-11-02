set :stage, :production
set :rails_env, :production

role :app, %w{deployer@ohmpieng.org}
role :web, %w{deployer@ohmpieng.org}
role :db,  %w{deployer@ohmpieng.org}

server 'ohmpieng.org',
  user: 'deployer',
  roles: %w{web app db},
  primary: true,
  my_property: :my_value,
  ssh_options: {
    user: 'deployer', # overrides user setting above
    keys: %w(/Users/non/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
    # password: 'please use keys'
  }
