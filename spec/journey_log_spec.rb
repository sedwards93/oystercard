require 'journey_log'

describe Journey_Log do
  let(:journey) {double :journey}
  let(:entry_station) {double :entry_station}
  subject(:journey_log) {Journey_Log.new(journey)}

  describe 'initialize' do
    it "Instances of Journey_log are initialized with Journey class object" do
      expect(subject.journey_class).to eq(journey)
    end
  end

  describe '#start' do
    it "Starts new journey" do
      expect(subject.journey_class).to receive(:new).with(entry_station)
      subject.start
    end
  end

end