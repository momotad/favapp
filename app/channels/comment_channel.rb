class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "comment_channel"
    @app = App.find(params[:app_id])
    stream_for @app
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
