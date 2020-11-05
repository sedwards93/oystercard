require 'station'

describe Station do

  let(:station) {Station.new("Brixton", 1)}

  describe 'initialize' do
    it 'New instances of Station are created with the station name' do
      expect(station.name).to eq("Brixton")
    end
    it 'New instances of Station are created with the station zone' do
      expect(station.zone).to eq(1)
    end
  end

end