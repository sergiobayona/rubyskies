class WeatherController < ApplicationController
  def index
    @location = Location.find(params[:location_id]).find_or_create_latest_weather
  end
end
