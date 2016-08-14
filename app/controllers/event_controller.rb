# class EventController < WebsocketRails::BaseController
#   before_filter :only => :new_event do
#     puts "new_event was called"
#   end
#
#   def new_event
#     p "xxxxx"
#     # handle event
#     new_message = {:message => 'this is a message'}
#     send_message :test, new_message
#   end
# end
