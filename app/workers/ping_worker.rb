
class PingWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(server_id)
    server = Server.find(server_id)

  end

  def self.poller
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        # perform_async(server.id)
      end
    end
  end

  def self.test
    begin
      server = Server.find(1)
      `ping -c 1 -t1 "#{server.ip_address}" | grep "round-trip"`
    rescue
      p "xxx"
    end
  end
end
