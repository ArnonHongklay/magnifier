class Disk < ActiveRecord::Base
  has_many :servers
end
