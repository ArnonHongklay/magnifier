set :stage, :production
set :rails_env, :production

role :app, %w{deploy@ohmpieng.io}
role :web, %w{deploy@ohmpieng.io}
role :db,  %w{deploy@ohmpieng.io}

server 'ohmpieng.io',
  user: 'deploy',
  roles: %w{web app db},
  primary: true,
  my_property: :my_value,
  ssh_options: {
    user: 'deploy', # overrides user setting above
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
    # password: 'please use keys'
  }
