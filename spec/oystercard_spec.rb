require 'oystercard'
describe Oystercard do

  it "Can create instances of the Oystercard class" do
    expect(subject).to be_an_instance_of(Oystercard)
  end
  it "Instances of the Oystercard class are initialized witha balance of 0" do
    expect(subject.balance).to eq(0)
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

  # describe '#deduct' do
  #   it "Insrances of the Oystercard class can respond to the deduct method" do
  #     expect(subject).to respond_to(:deduct).with(1).argument
  #   end
  #   it "When invoked, the balance of the oystercard will decrease by the balance amount" do
  #     subject.top_up(20)
  #     expect { subject.deduct(10) }.to change { subject.balance }.from(20).to(10)
  #   end
  # end

  describe '#in_journey?' do
    it "Instances of the Oystercard class can respond to the in_journey? method" do
      expect(subject).to respond_to(:in_journey?)
    end
    it "Instances of the Oystercard class are will respond to in_journey and return false" do
      expect(subject.in_journey?).to eq(false)
    end
  end

  describe '#touch_in' do
    it "Instances of the Oystercard class can respond to the touch_in method" do
      expect(subject).to respond_to(:touch_in)
    end
    it "When invoked, expect in_journey? to return true" do
      subject.top_up(Oystercard::MINIMUM)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it "Raises an error when there are insufficient funds on the oystercard" do
      expect { subject.touch_in }.to raise_error "You have insufficient funds."
    end
  end

  describe '#touch_out' do
    it "Insrances of the Oystercard class can respond to the in_journey? method" do
      expect(subject).to respond_to(:touch_out)
    end
    it "When invoked, expect in_journey to return false" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
    it "It reduces the balance by the minimum fare of £1." do
      subject.top_up(Oystercard::MINIMUM)
      expect {subject.touch_out}.to change {subject.balance }.by(-1)
    end
  end
end
