class TaskController < WebsocketRails::BaseController
  def create
    # The `message` method contains the data received
    send_message :create_success, message, :namespace => :tasks
  end
end
