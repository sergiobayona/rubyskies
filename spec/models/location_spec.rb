require 'rails_helper'

RSpec.describe Location, type: :model do # rubocop:disable Metrics/BlockLength
  before do
    Weather.destroy_all
    Location.destroy_all
    Weather.create(country: 'US', postal_code: '90210', data: { "current_temperature": '72' })
  end

  let(:location) { Location.create(city: 'Atlanta', state: 'GA', country: 'US', postal_code: '90210') }

  describe '#weathers' do
    it "returns the weather for the location's country and postal code" do
      temperature = location.weathers.first.data['current_temperature']
      expect(temperature).to eq('72')
    end
  end

  describe '#latest_weather' do
    it "returns the latest weather for the location's country and postal code" do
      temperature = location.latest_weather.data['current_temperature']
      expect(temperature).to eq('72')
    end

    it "returns nil if there is no recent weather for the location's country and postal code" do
      Weather.destroy_all
      Weather.create(country: 'US', postal_code: '90210', data: { "current_temperature": '72' }, created_at: 1.day.ago)

      expect(location.latest_weather).to be_nil
    end
  end

  describe '#find_or_create_latest_weather' do
    before do
      Weather.destroy_all
      Location.destroy_all
    end

    let!(:location) { Location.create(city: 'Atlanta', state: 'GA', country: 'US', postal_code: '90210') }

    context "when there is recent weather for the location's country and postal code" do
      let!(:weather) { Weather.create(country: 'US', postal_code: '90210', data: { "current_temperature": '72' }) }

      it 'returns the latest weather if it exists' do
        expect(location.find_or_create_latest_weather).to eq(weather)
      end

      it 'does not create a new weather record for the location' do
        expect do
          location.find_or_create_latest_weather
        end.to_not change(Weather, :count)
      end
    end

    context "when there is no recent weather for the location's country and postal code" do
      it 'creates a new weather record for the location', :vcr do
        expect do
          location.find_or_create_latest_weather
        end.to change(Weather, :count).by(1)
      end
    end
  end
end
