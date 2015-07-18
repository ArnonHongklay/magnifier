class HardWorker
  include Sidekiq::Worker

  def perform(server_id)
    server = Server.find(server_id)
    url = "http://#{server.ip_address}:9999/arp_cache"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)
    
    items.each do |item|
      p item['address']
    end
  end

  def self.poller
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        p "OK GOOD"
        perform_async(server.id)
      end
    end
  end
end
