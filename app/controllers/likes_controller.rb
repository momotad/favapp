class LikesController < ApplicationController
  before_action :set_app

  def create
    like = current_user.likes.build(app_id: params[:app_id])
    like.save
    respond_to app_path(@app.id)
    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    like = Like.find_by(app_id: params[:app_id], user_id: current_user.id)
    like.destroy
    respond_to apps_path
    # respond_to do |format|
    #   format.js
    # end
  end

  def set_app
    @app = App.find(params[:app_id])
  end
end
