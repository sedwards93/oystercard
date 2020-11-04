class Oystercard
  attr_reader :balance, :entry_station
  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @entry_station = nil
    
  end

  def top_up(amount)
    raise "You cannot have more than £#{LIMIT} credit" if amount + balance > LIMIT
    @balance += amount
  end

  def in_journey?
    if @entry_station
      true
    else
      false
    end
  end

  def touch_in(station)
    raise "You have insufficient funds." if balance < MINIMUM
    @entry_station = station
  end

  def touch_out
    deduct(1)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end