class DashboardController < ApplicationController
  before_action :authenticate_account!
  before_filter :verify_account!
  layout 'accounts'

  def index
    @account = current_account
    @account.servers.each do |s|
      memory = $redis.hkeys "Server #{s.id} Memory"
      @mem_free = []
      @mem_available = []
      @mem = []
      memory.each do |r|
        case r
        when /mem_free/
          @mem_free.push([
            Time.at(r.gsub("mem_free: ", "").to_i).to_formatted_s(:short),
            $redis.hget("Server #{s.id} Memory", r).gsub("kB", "").to_i * 0.001024
          ])
        when /mem_available/
          @mem_available.push([
            Time.at(r.gsub("mem_available: ", "").to_i).to_formatted_s(:short),
            $redis.hget("Server #{s.id} Memory", r).gsub("kB", "").to_i * 0.001024
          ])
        end
      end

      @mem_free.each_with_index do |x, index|
        @mem.push [@mem_free[index].first, @mem_free[index].second.to_i, @mem_available[index].second.to_i]
      end

      io = $redis.hkeys "Server #{s.id} IO vda"
      @reads = []
      @writes = []
      @io = []

      io.each do |r|
        case r
        when /reads/
          @reads.push $redis.hget("Server #{s.id} IO vda", r).to_i * 0.001024
        when /writes/
          @writes.push $redis.hget("Server #{s.id} IO vda", r).to_i * 0.001024
        end
      end

      @reads.each_with_index do |x, index|
        @io.push [index, @reads[index], @writes[index]]
      end
    end

    respond_to do |format|
      format.html { render "accounts/dashboard" }
      format.json { render "accounts/dashboard" }
    end
  end
end
