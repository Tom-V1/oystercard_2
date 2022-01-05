class Oystercard


  attr_reader :balance, :journeys

  MAXIMUM_BALANCE = 90 
  MINIMUM_CHARGE = 1
 
  def initialize
    @balance = 0
    @journeys = Hash.new
  end

  def top_up(money)
    fail 'Maximum balance of #{maximum_balance} exceeded' if balance_check(money)
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE
    log_entry(station)
    
  end 

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    log_exit(station)

  end 

  private 

  def log_entry(station)
    @journeys[:entry_station] = station
  end 

  def log_exit(station)
    @journeys[:exit_station] = station
  end 
  

  def deduct(money)
    @balance -= money
  end

  def balance_check(money)
    amount = @balance + money
    return true if amount > MAXIMUM_BALANCE
    false
  end

end
