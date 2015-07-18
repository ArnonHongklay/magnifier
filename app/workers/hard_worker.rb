class HardWorker
  include Sidekiq::Worker

  def perform(server_id)
    # server = Server.find(server_id)
    # memory(server)
  end

  def self.poller
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        # perform_async(server.id)

        memory(server)
      end
    end
  end

  def self.memory(server)
    memory = server.memories.first_or_create

    url = "http://#{server.ip_address}:9999/memory_info"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    memory.mem_total = items['MemTotal'].gsub(/\s+/m, "")
    memory.save!
    # items.each do |item|
    #   # p item['address']
    # end
  end
end
