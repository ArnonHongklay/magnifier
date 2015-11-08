class MiddleWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        arp(server)
        disk(server)
      end
    end
  end

  def arp(server)
    url = "http://#{server.ip_address}:1337/arp_cache"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    items.each do |item|
      arp = server.arps.where(hw_address: item['hw_address']).first_or_create
      arp.address     = item['address']
      arp.hw_type     = item['hw_type']
      arp.hw_address  = item['hw_address']
      arp.flags       = item['flags']
      arp.mask        = item['mask']
      arp.save!
    end
  end

  def disk(server)
    url = "http://#{server.ip_address}:1337/disk_partitions"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    items.each do |item|
      disk = server.disks.where(mounted: item['mounted']).first_or_create
      disk.file_system   = item['file_system']
      disk.size          = item['size']
      disk.used          = item['used']
      disk.avail         = item['avail']
      disk.used_percent  = item['used_percent']
      disk.mounted       = item['mounted']
      disk.save!
    end
  end
end
