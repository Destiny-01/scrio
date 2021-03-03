class MessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # mine = ApplicationController.render(
    #   partial: 'messages/mine',
    #   locals: { message: message }
    # )

    # yours = ApplicationController.render(
    #   partial: 'messages/yours',
    #   locals: { message: message }
    # )
    html = ApplicationController.render(
     partial: 'messages/message',
     locals: { message: message }
    )

    ActionCable.server.broadcast "room_channel_5", html: html
  end
end
