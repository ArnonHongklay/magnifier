# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5, :backtrace => true

  def perform(name, count)
    puts 'Doing hard work #{name}, #{count}'

  end

  def self.poller
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        url = "http://#{server.ip_address}:9999/arp_cache"
        response = Net::HTTP.get_response(URI.parse(url))
        items = JSON.parse(response.body)

        items.each do |item|
          p item['address']
        end
      end
    end
    # 5.times do |x|
    #   perform_async("Non Madden", x)
    # end
  end
end
