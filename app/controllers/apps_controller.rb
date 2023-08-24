class AppsController < ApplicationController
  def index
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.valid?
      @app.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def list
    @apps = App.all.order('created_at DESC')
  end


  private
  def app_params
    params.require(:app).permit(:image, :name, :content, :genre_id).merge(user_id: current_user.id)
  end

end
