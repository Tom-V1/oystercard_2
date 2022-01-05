class Oystercard

  attr_reader :balance
  attr_reader :entry_station

  MAXIMUM_BALANCE = 90 
  MINIMUM_CHARGE = 1
 
  def initialize
    @balance = 0
  end

  def top_up(money)
    fail 'Maximum balance of #{maximum_balance} exceeded' if balance_check(money)
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    @entry_station = station
  end 

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end 

  def in_journey? 
    !!entry_station
  end

  private 

  def deduct(money)
    @balance -= money
  end

  def balance_check(money)
    amount = @balance + money
    return true if amount > MAXIMUM_BALANCE
    false
end
end
