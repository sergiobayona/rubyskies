class Weather < ApplicationRecord
  attr_accessor :location

  def get_weather(record)
    GPTWeather.get_weather(record)
  end
end
