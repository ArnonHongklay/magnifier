class CheckdataWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?

        begin
          disk = Disk.where(server_id: server.id, mounted: "/")
          disk.each do |d|
            totle = ((d.used.gsub("G","").to_f / d.size.gsub("G","").to_f) * 100)

            if totle >= 80
              $redis.publish("ping.error", "")
              logger.error (totle)
              MessageMailer.auto_mail(account, @automail).deliver

              notificat = Notificat.new
              notificat.account_id = account.id
              notificat.subject    = "Information From Server Monitor"
              notificat.body       = "Disk ของคุณใกล้จะเต็มแล้ว"
              notificat.save!
            end
          # enddisk each
          end
        rescue
          logger.info "Doing fail"
        end
      # endserver ipaddress
      end
    # endaccount server
    end
  # endperform
  end
# endclass
end
