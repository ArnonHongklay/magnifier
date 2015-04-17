set :stage, :staging
set :rails_env, :production

role :app, %w{deploy@staging.ohmpieng.io}
role :web, %w{deploy@staging.ohmpieng.io}
role :db,  %w{deploy@staging.ohmpieng.io}

server 'staging.ohmpieng.io',
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
