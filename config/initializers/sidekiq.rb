
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/0' }
  config.failures_max_count = 5000
  config.average_scheduled_poll_interval = 15
end
