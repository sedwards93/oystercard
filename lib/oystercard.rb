require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    @journeys = []
    @journey = journey
    
  end

  def top_up(amount)
    raise "You cannot topup over £#{LIMIT}" if amount + balance > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    terminate_journey if @journey.exit_station
    raise "You have insufficient funds." if balance < MINIMUM
    @journey.entry_station = entry_station
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    terminate_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def terminate_journey
    deduct(@journey.fare)
    entry_station = @journey.entry_station
    exit_station = @journey.exit_station
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @journey = nil
  end

end