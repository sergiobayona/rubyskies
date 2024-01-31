require 'rails_helper'

RSpec.describe GptWeather, type: :model do
  let(:location) do
    Weather.new(city: 'Atlanta', state: 'Georgia', postal_code: '30097')
  end

  let(:weather_report) { described_class.get_weather(location) }

  it 'should return a hash', :vcr do
    expect(weather_report).to be_a(Hash)
    expect(weather_report).to have_key('city')
    expect(weather_report).to have_key('state')
    expect(weather_report).to have_key('postal_code')
    expect(weather_report).to have_key('current_temperature')
    expect(weather_report).to have_key('temp_min')
    expect(weather_report).to have_key('temp_max')
  end
end
