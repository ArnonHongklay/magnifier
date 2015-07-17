class Server < ActiveRecord::Base
  has_many :accounts
  has_many :cpus
  has_many :memories
  has_many :disks
  has_many :arps
  has_many :bandwidths
  has_many :ios
  has_many :load_avgs
end
