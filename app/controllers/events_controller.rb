
class EventsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    response.stream.write sse(nil, event: "hello")

    subscriber = Redis.new
    begin
      subscriber.subscribe('ping.error') do |on|
        on.message do |event, data|
          response.stream.write sse(data, event: :ping)
        end
      end

    rescue IOError
      logger.info "stream closed"
    ensure
      subscriber.quit
      response.stream.close
    end
  end

  private
    def sse(data, options = {})
      (options.map{|k,v| "#{k}: #{v}" } << "data: #{data}").join("\n") + "\n\n"
    end
end
