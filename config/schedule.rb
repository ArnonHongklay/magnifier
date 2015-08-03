# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


# whenever --update-crontab ohmpieng --set environment=development
# * * * * * sleep 00; some_job
# * * * * * sleep 15; some_job
# * * * * * sleep 30; some_job
# * * * * * sleep 45; some_job

every '* * * * * sleep 00;' do
  runner "HardWorker.poller"
end

every '* * * * * sleep 30;' do
  runner "HardWorker.poller"
end

every '* * * * * sleep 30;' do
  runner "PingWorker.poller"
end

every 5.minutes do
  runner "MiddleWorker.poller"
end

every 1.days do
  runner "EasyWorker.poller"
end
