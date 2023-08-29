class AppsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_app, only: [:show, :edit, :update, :destroy]
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
    @comments = @app.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    if current_user.id == @app.user.id
      render :edit
    else
      redirect_to '/'
    end
  end

  def update
    if @app.update(app_params)
      redirect_to list_app_apps_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @app.user.id
      @app.destroy
      redirect_to '/'
    end
  end

  def search
    @q = App.ransack(params[:q])
    @apps = @q.result
  end


  private
  def app_params
    params.require(:app).permit(:image, :name, :content, :genre_id).merge(user_id: current_user.id)
  end

  def set_app
    @app = App.find(params[:id])
  end

end
