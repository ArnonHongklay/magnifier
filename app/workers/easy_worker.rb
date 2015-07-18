
class EasyWorker
  include Sidekiq::Worker

  def perform(server_id)
    server = Server.find(server_id)

    self.update_server(server)
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

  def self.update_server(server)
    url = "http://#{server.ip_address}:9999/general_info"
    response = Net::HTTP.get_response(URI.parse(url))
    item = JSON.parse(response.body)

    server.os       = item['os']
    server.hostname = item['Hostname']
    server.uptime   = item['Uptime']
    server.datetime = item['Server Time']
  end
end
