require 'resque/tasks'
require 'resque_scheduler/tasks'

task 'resque:setup' => :environment do
  require 'resque'
  require 'resque_scheduler'
  require 'resque/scheduler'

  ENV['QUEUE']    ||= '*'
  ENV['INTERVAL'] ||= '1'

  while true do
    schedule        = YAML.load_file(Rails.root.join('config', 'schedule.yml'))
    Resque.schedule = schedule
    break if Resque.schedule.count == schedule.count
    sleep 5.seconds # Ensure that redis properly syncs up
    break if Resque.reload_schedule!.count == schedule.count
    Rails.logger.error "Loaded schedule (#{Resque.schedule.count}) is less than configured (#{schedule.count})! Retrying..."
  end
end

desc "Alias resque:work to jobs:work"
task 'jobs:work' => 'resque:work'
