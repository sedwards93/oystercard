require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey
  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0)
    @balance = balance
    # @entry_station = nil
    # @exit_station = nil
    @journeys = []
    @journey = nil
    
  end

  def top_up(amount)
    raise "You cannot topup over £#{LIMIT}" if amount + balance > LIMIT
    @balance += amount
  end

  # def in_journey?
  #   @entry_station ? true : false
  # end

  def touch_in(entry_station)
    terminate_journey if @journey
    raise "You have insufficient funds." if balance < MINIMUM
    @journey = Journey.new(entry_station)
    # @entry_station = entry_station
  end

  def touch_out(exit_station)
    # deduct(MINIMUM)
    # @exit_station = exit_station
    if @journey == nil
      @journey = Journey.new
    end
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