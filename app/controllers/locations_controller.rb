class LocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    channel_title = TitleFetcher.get_channel_title(location_params['url'])
    @location = Location.new(location_params.merge({title: channel_title}))

    respond_to do |format|
      if @location.save
        format.html { redirect_to root_path, notice: 'RSS feed entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    channel_title = TitleFetcher.get_channel_title(location_params['url'])
    respond_to do |format|
      if @location.update(location_params.merge({title: channel_title}))
        format.html { redirect_to root_path, notice: 'RSS feed entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'RSS feed entry was successfully destroyed.' }
    end
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:title, :url)
  end
end
