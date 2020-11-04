require 'oystercard'
describe Oystercard do
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}

  it "Can create instances of the Oystercard class" do
    expect(subject).to be_an_instance_of(Oystercard)
  end
  it "Instances of the Oystercard class are initialized witha balance of 0" do
    expect(subject.balance).to eq(0)
  end
  it "Instances of the Oystercard class are initialized with an empty journey instance" do 
    expect(subject.journeys).to be_empty
  end

  describe '#top_up' do
    it "Insrances of the Oystercard class can respond to the top_up method" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it "When invoked, the balance of the oystercard will increase by the balance amount" do
      expect { subject.top_up(10) }.to change { subject.balance }.from(0).to(10)
    end
    it "Raises an error when the user tries to top up above the maximum limit" do
      limit = Oystercard::LIMIT
      expect { subject.top_up(limit + 1)}.to raise_error "You cannot have more than £#{limit} credit"
    end
  end

  describe '#in_journey?' do
    it "Instances of the Oystercard class can respond to the in_journey? method" do
      expect(subject).to respond_to(:in_journey?)
    end
  end

  describe '#touch_in' do
    it "When invoked, expect in_journey? to return true" do
      subject.top_up(Oystercard::MINIMUM)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end
    it "Raises an error when there are insufficient funds on the oystercard" do
      expect { subject.touch_in(entry_station) }.to raise_error "You have insufficient funds."
    end
    it "Instances of the Oystercard class remember the entry station after touch_in" do
      subject.top_up(Oystercard::MINIMUM)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station) 
    end
    
    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
    it "Stores a complete journey" do
      subject.top_up(Oystercard::MINIMUM)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end

  describe '#touch_out' do
    it "Instances of the Oystercard class can respond to the in_journey? method" do
      expect(subject).to respond_to :touch_out
    end
    it "When invoked, expect in_journey to return false" do
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
    it "It reduces the balance by the minimum fare of £1." do
      subject.top_up(Oystercard::MINIMUM)
      expect {subject.touch_out(exit_station)}.to change {subject.balance }.by(-1)
    end
    it "Instances of the Oystercard class set the entry_station to nil after touch_out" do
      subject.top_up(Oystercard::MINIMUM)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq(nil)
    end
    it "Touches out of a specific station" do
      subject.top_up(Oystercard::MINIMUM)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq(exit_station)
    end
  end
end
