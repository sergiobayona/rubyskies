class WeatherController < ApplicationController
  def index
    @weather = Location.find(params[:location_id]).find_or_create_latest_weather
  end
end
