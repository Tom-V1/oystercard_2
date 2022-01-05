require "./lib/oystercard.rb"
require "./lib/station.rb"
require "./lib/journey.rb"


p new = Journey.new(entry_station: "1")

p new.finish("2")