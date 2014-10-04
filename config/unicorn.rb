working_directory "/home/non/ohmpieng/project/production/current/public"
pid "/home/non/ohmpieng/project/production/current/pids/unicorn.pid"
stderr_path "/var/www/my_app/log/unicorn.log"
stdout_path "/var/www/my_app/log/unicorn.log"

listen "/tmp/unicorn.zhila.sock"
listen "/tmp/unicorn.production.sock"

worker_processes 4

timeout 30
