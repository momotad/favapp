class AppsController < ApplicationController
  def index
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
  end



  private
  def app_params
    params.require(:app).permit(:image, :name, :content, :genre_id).merge(user_id: current_user.id)
  end

end
