
class PingWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(server_id)
    server = Server.find(server_id)

    begin
      test = `ping -c 1 -t1 "#{server.ip_address}" | grep "round-trip"`
      if test == ""
        $redis.publish("ping.error", server.ip_address)
        logger.error "ping fail #{server.ip_address}"
      end
    rescue
      logger.info "Doing fail"
    end
  end

  def self.poller
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        perform_async(server.id)
      end
    end
  end
end
