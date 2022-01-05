class Journey
  attr_reader :entry_station, :exit_station


  PENALTY_FARE = 5

  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false
  end 
  

  def fare
    return PENALTY_FARE if penalty?
    1
  end

  def finish(station)
    @exit_station = station
    @complete = true
    self
  end 

  def complete?
    @complete
  end

  def penalty?
    (!entry_station || !exit_station)
  end 

end