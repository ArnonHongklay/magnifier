
class EasyWorker
  include Sidekiq::Worker
  # sidekiq_options :retry => 5, :backtrace => true

  def perform(count)
    puts 'Doing easy work #{count}'
  end

  def self.poller
    5.times do |x|
      perform_async(x)
    end
  end
end
