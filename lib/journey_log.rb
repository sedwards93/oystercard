

class Journey_Log
attr_reader :journey_class

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
  end

  def start(entry_station)
  end
end