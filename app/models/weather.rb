class Weather < ApplicationRecord
  validates :country, :postal_code, presence: true

  def location
    Location.where('locations.country = ? AND locations.postal_code = ?', country, postal_code).first
  end

  def location_name
    "#{location.city}, #{location.state} #{location.postal_code}, #{location.country}"
  end

  def temperature
    data['current_temperature']
  end

  def conditions
    data['conditions']
  end

  def temp_min
    data['temp_min']
  end

  def temp_max
    data['temp_max']
  end
end
