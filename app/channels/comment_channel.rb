class CommentChannel < ApplicationCable::Channel
  def subscribed
    @app = App.find(params[:app_id])
    stream_for @app
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
