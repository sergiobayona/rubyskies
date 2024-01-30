class WeatherController < ApplicationController
  def index
    @weather = Weather.new
  end

  def create
    @weather = Weather.new(weather_params)
    if @weather.save
      redirect_to weather_path(@weather)
    else
      render 'index'
    end
  end

  def show
    @weather = Weather.find(params[:id])
  end

  private

  def weather_params
    params.require(:weather).permit(:location, :address_line_1, :address_line_2, :city, :state, :postal_code, :country)
  end
end
