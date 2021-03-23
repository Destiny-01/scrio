class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # ActionCable.server.broadcast "activity_channel", user_id: current_user.id, status: 'offline'
  end

  def appear
    ActionCable.server.broadcast "activity_channel", user_id: current_user.id, status: 'online'
  end
end
