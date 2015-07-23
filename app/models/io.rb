class Io < ActiveRecord::Base
  belongs_to :server

  after_save :server_saved

  private
    def server_saved
      $redis.hset("Server #{server_id} IO #{device}", "reads: #{Time.now.to_i}",  reads)
      $redis.hset("Server #{server_id} IO #{device}", "writes: #{Time.now.to_i}", writes)
    end
end
