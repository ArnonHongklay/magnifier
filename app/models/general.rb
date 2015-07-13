class General < ActiveRecord::Base
  has_many :accounts
  has_many :cpus, through: :accounts
  has_many :memories, through: :accounts
  has_many :disks, through: :accounts
  has_many :arps, through: :accounts
  has_many :bandwidths, through: :accounts
  has_many :ios, through: :accounts
  has_many :load_avgs, through: :accounts
  has_many :generals, through: :accounts
end
