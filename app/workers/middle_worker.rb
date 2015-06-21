
class MiddleWorker
  include Sidekiq::Worker
  # sidekiq_options :retry => 5, :backtrace => true

  def perform(name, count)
    puts 'Doing middle work'
  end
end
