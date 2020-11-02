class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
    if @balance > LIMIT
      @balance -= amount
      raise "You cannot have more than £#{LIMIT} credit"
    end
  end
end