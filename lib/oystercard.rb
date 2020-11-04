class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys
  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    
  end

  def top_up(amount)
    raise "You cannot topup over £#{LIMIT}" if amount + balance > LIMIT
    @balance += amount
  end

  def in_journey?
    @entry_station ? true : false
  end

  def touch_in(entry_station)
    raise "You have insufficient funds." if balance < MINIMUM
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM)
    @exit_station = exit_station
    save_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def save_journey
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
  end

end