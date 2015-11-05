#
# class EasyWorker
#
#   def self.queue
#     :sloth
#   end
#
#   def self.perform(server_id)
#     server = Server.find(server_id)
#
#     EasyWorker.update_server(server)
#   end
#
#   def self.poller
#     Account.all.each do |account|
#       next if account.servers.empty?
#       account.servers.each do |server|
#         next if server.ip_address.nil?
#         perform_async(server.id)
#       end
#     end
#   end
#
#   def self.update_server(server)
#     url = "http://#{server.ip_address}:9999/general_info"
#     response = Net::HTTP.get_response(URI.parse(url))
#     item = JSON.parse(response.body)
#
#     server.os       = item['OS']
#     server.hostname = item['Hostname']
#     server.uptime   = item['Uptime']
#     server.datetime = item['Server Time']
#     server.save!
#   end
# end

class EasyWorker
  include Sidekiq::Worker
  # sidekiq_options queue: :critical, retry: true

  def perform(server_id)
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        update_server(server.id)
      end
    end
  end

  def self.update_server(server)
    url = "http://#{server.ip_address}:9999/general_info"
    response = Net::HTTP.get_response(URI.parse(url))
    item = JSON.parse(response.body)

    server.os       = item['OS']
    server.hostname = item['Hostname']
    server.uptime   = item['Uptime']
    server.datetime = item['Server Time']
    server.save!
  end
end
