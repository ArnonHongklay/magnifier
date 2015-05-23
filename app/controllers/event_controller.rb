class EventController < WebsocketRails::BaseController
  before_filter :only => :new_event do
    puts "new_event was called"
  end

  def new_event
    # handle event
    new_message = {:message => 'this is a message'}
    send_message :test, new_message
  end

  # def index
  #   controller_store[:message_count] = 0
  # end
end
