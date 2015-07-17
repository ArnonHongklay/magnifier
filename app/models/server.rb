class Server < ActiveRecord::Base
  belongs_to :account
  belongs_to :cpus
  belongs_to :memories
  belongs_to :disks
  belongs_to :arp
  belongs_to :bandwidths
  belongs_to :ios
  belongs_to :load_avgs
end
