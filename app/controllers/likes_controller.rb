class LikesController < ApplicationController

  def create
    like = current_user.likes.build(app_id: params[:id])
    @app = App.find(like.app_id)
    like.save
    render template: "apps/show"
  end

  def destroy
    like = Like.find_by(app_id: params[:id], user_id: current_user.id)
    @app = App.find(like.app_id)
    like.destroy
    render template: "apps/show"
  end

end
