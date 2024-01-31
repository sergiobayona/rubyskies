class Location < ApplicationRecord
  attr_accessor :location_string, :cached_weather

  def weathers
    Weather.where('weathers.country = ? AND weathers.postal_code = ?', country, postal_code)
  end

  def latest_weather
    weathers.where('weathers.created_at > ?', 30.minutes.ago).first
  end

  def find_or_create_latest_weather
    if latest_weather.present?
      self.cached_weather = true
      return latest_weather
    end

    weather_report = GptForecaster.get_weather(self)
    Weather.create(country:, postal_code:, data: weather_report)
  end
end
