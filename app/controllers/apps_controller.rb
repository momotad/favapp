class AppsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    if @app.valid?
      @app.save
      redirect_to list_apps_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def list
    @apps = App.all.order('created_at DESC')
  end

  def show
    @app = App.find(params[:id])
  end


  private
  def app_params
    params.require(:app).permit(:image, :name, :content, :genre_id).merge(user_id: current_user.id)
  end

end
