class Memory < ActiveRecord::Base
  belongs_to :server

  after_save :server_saved

  private
    def server_saved
      $redis.hset("Server #{server_id} Memory", "mem_free: #{Time.now.to_i}",      mem_free)
      $redis.hset("Server #{server_id} Memory", "mem_available: #{Time.now.to_i}", mem_available)
    end
end
