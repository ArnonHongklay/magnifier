class Server < ActiveRecord::Base
  belongs_to :account
  belongs_to :cpu
  belongs_to :memory
  belongs_to :disk
  belongs_to :arp
  belongs_to :bandwidth
  belongs_to :io
  belongs_to :load_avg
end
