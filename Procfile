web:          bundle exec puma -t 5:5 -p 1337 -e ${RACK_ENV:-development} -C ./config/puma.rb --control unix:///tmp/ohmpieng.sock --control-token 1234
worker:       bundle exec rake resque:work QUEUE='*'
scheduler:    bundle exec rake resque:scheduler VERBOSE=true
