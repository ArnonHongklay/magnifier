class LoadAvg < ActiveRecord::Base
  belongs_to :server

  after_save :server_saved

  private
    def server_saved
      $redis.hset("Server #{server_id} LoadAvg", "one_min_avg: #{Time.now.to_i}",     one_min_avg)
      $redis.hset("Server #{server_id} LoadAvg", "five_min_avg: #{Time.now.to_i}",    five_min_avg)
      $redis.hset("Server #{server_id} LoadAvg", "fifteen_min_avg: #{Time.now.to_i}", fifteen_min_avg)
    end
end
