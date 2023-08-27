class LikesController < ApplicationController
  before_action :set_app

  def create
    like = current_user.likes.build(app_id: params[:id])
    # @app = App.find(like.app_id)
    like.save
    respond_to do |format|
      format.js
    end
    # render template: "apps/show" renderで別コントローラーのアクションを実行する場合のコード
  end

  def destroy
    like = Like.find_by(app_id: params[:id], user_id: current_user.id)
    # @app = App.find(like.app_id)
    like.destroy
    respond_to do |format|
      format.js
    end
    # render template: "apps/show"# render template: "apps/show" renderで別コントローラーのアクションを実行する場合のコード
  end

  def set_app
    @app = App.find(params[:id])
  end

end
