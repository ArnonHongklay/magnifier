
class EasyWorker
  include Sidekiq::Worker
  # sidekiq_options :retry => 5, :backtrace => true
  # queue_as :default

  def perform(count)
    puts 'Doing easy work #{count}'
  end

  def self.last_night_work
    1.times do |x|
      perform_async(x)
    end
  end
end
