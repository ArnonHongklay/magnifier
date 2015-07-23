class Bandwidth < ActiveRecord::Base
  belongs_to :server

  after_save :server_saved

  private
    def server_saved
      $redis.hset("Server #{server_id} Bandwidth #{interface}", "tx: #{Time.now.to_i}", tx)
      $redis.hset("Server #{server_id} Bandwidth #{interface}", "rx: #{Time.now.to_i}", rx)
    end
end
