web: bundle exec puma -p 1337 -C ./config/puma.rb --control unix:///tmp/ohmpieng.sock --control-token 1234
worker: bundle exec sidekiq
scheduler: bundle exec whenever
socket: bundle exec rake websocket_rails:start_server
