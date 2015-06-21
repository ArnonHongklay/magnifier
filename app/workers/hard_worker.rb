# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5, :backtrace => true

  def perform(name, count)
    puts 'Doing hard work'
  end
end
