require 'journey'

describe Journey do
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  subject {Journey.new(entry_station)} 

  describe 'initialize' do
    it "Initialized with an optional entry_station" do
      expect(subject.entry_station).to eq(entry_station)
    end
    it "Initialized with an exit_station instance variable" do
      expect(subject.exit_station).to eq(nil)
    end
  end

  describe '#finish' do
    it 'Instances of journey respond to finish method' do
      expect(subject).to respond_to(:finish).with(1).argument
    end
    it 'Changes the journeys exit_station variable' do
      subject.finish(exit_station)
      expect(subject.exit_station).to eq(exit_station)
    end
  end

  describe '#complete' do
    it 'Instances of journey respond to complete? method' do
      expect(subject).to respond_to :complete?
    end
    it 'journeys with entry and exit station are complete' do
      subject.finish(exit_station)
      expect(subject).to be_complete
    end
  end

  describe '#fare' do
  it 'Instances of journey respond to fare method' do
    expect(subject).to respond_to :fare
  end
  it 'charges a standard fare if journey.complete?' do
    subject.finish(exit_station)
    expect(subject.fare).to eq(Journey::MINIMUM_FARE)
  end
  it 'charges a maximum fare if journey is not complete' do
    expect(subject.fare).to eq(Journey::MAXIMUM_FARE)
  end
end

end
