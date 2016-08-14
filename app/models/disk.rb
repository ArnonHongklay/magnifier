class Disk < ActiveRecord::Base
  belongs_to :server

  after_save :server_saved

  private
    def server_saved
      $redis.hset("Server #{server_id} DISK #{mounted}", "used: #{Time.now.to_i}",   used)
      $redis.hset("Server #{server_id} DISK #{mounted}", "avail: #{Time.now.to_i}", avail)
    end
end
