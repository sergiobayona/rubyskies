class LocationController < ApplicationController
  def index
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_weather_index_path(@location)
    else
      render 'index'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:location_string, :address_line_1, :address_line_2, :city, :state, :postal_code,
                                     :country)
  end
end
