class Oystercard
  attr_reader :balance
  LIMIT = 90
  MINIMUM = 1

  def initialize
    @balance = 0
    @status = false
  
  end

  def top_up(amount)
    raise "You cannot have more than £#{LIMIT} credit" if amount + balance > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @status
  end

  def touch_in
    raise "You have insufficient funds." if @balance < MINIMUM
    @status = true
  end

  def touch_out
    @status = false
  end
end