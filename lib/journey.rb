class Journey

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    complete? ? MINIMUM_FARE : MAXIMUM_FARE
  end
  
end