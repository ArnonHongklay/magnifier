
class MiddleWorker
  include Sidekiq::Worker
  # sidekiq_options :retry => 5, :backtrace => true

  def perform(name, count)
    puts 'Doing middle work #{name} #{count}'
  end

  def self.poller
    5.times do |x|
      perform_async("Non Madden", x)
    end
  end
end
