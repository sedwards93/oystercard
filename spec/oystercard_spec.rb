require 'oystercard'

describe Oystercard do
  
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:topped_up_card) {Oystercard.new(Oystercard::MINIMUM)}

  it "Can create instances of the Oystercard class" do
    expect(subject).to be_an_instance_of(Oystercard)
  end

  it "Instances of the Oystercard class are initialized witha balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "Instances of the Oystercard class are initialized an journeys instance" do 
    expect(subject.journeys).to be_empty
  end

  # let(:journey) {double :journey}
  # it "Instances of the Oystercard class are initialized with a journey instance" do
  #   expect(subject.journey).be_an_instance_of :journey
  # end

  describe '#top_up' do

    it "Insrances of the Oystercard class can respond to the top_up method" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "When invoked, the balance of the oystercard will increase by the balance amount" do
      expect { subject.top_up(10) }.to change { subject.balance }.from(0).to(10)
    end

    it "Raises an error when the user tries to top up above the maximum limit" do
      expect { subject.top_up((Oystercard::LIMIT) + 1)}.to raise_error "You cannot topup over £#{Oystercard::LIMIT}"
    end
  end

  describe '#touch_in' do

    it "Instances of the oystercard class respond to touch_in" do
      expect(topped_up_card).to respond_to(:touch_in).with(1).argument
    end

    it "Raises an error when there are insufficient funds on the oystercard" do
      expect { subject.touch_in(entry_station) }.to raise_error "You have insufficient funds."
    end

  end

  describe '#touch_out' do
    it "Instances of the oystercard class respond to touch_out" do
      expect(topped_up_card).to respond_to(:touch_out).with(1).argument
    end
  end

    # it "It reduces the balance by the minimum fare of £1." do
    #   expect {subject.touch_out(exit_station)}.to change {subject.balance }.by(-1)
    # end

    # context 'Completed Journey' do
    #   let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
    #   before do
    #     topped_up_card.touch_in(entry_station)
    #     topped_up_card.touch_out(exit_station) 
    #   end

      # it "Stores a complete journey" do
      #   expect(topped_up_card.journeys).to include journey
      # end

      # it "Instances of the Oystercard class set the entry_station to nil after touch_out" do
      #   expect(topped_up_card.entry_station).to eq(nil)
      # end

      # it "Touches out of a specific station" do
      #   expect(topped_up_card.exit_station).to eq(exit_station)
      # end

  #     end
  # end
end

