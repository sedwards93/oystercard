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
end
