require 'rails_helper'

RSpec.describe Weather, type: :model do
  let!(:location) { Location.create!(country: 'US', postal_code: '90210') }
  let!(:weather) { Weather.create!(country: 'US', postal_code: '90210') }

  describe 'validations' do
    it 'is invalid without the required values' do
      weather = described_class.new
      expect(weather.valid?).to be_falsey
      expect(weather.errors[:country]).to include("can't be blank")
      expect(weather.errors[:postal_code]).to include("can't be blank")
    end
  end

  describe '#location' do
    it "returns the location for the weather's country and postal code" do
      expect(weather.location).to eq(location)
    end
  end

  describe '#location_name' do
    it 'returns the location name' do
      expect(weather.location_name).to eq('90210, US')
    end
  end
end
