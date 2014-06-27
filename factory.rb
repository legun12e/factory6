require_relative 'lib/factory_sim.rb'



#-------------------------------------#
#            Main Routine             #
#-------------------------------------#

puts "\n\nThis game simulates a single factory with multiple workstations. In a given day the work can process through every workstation, and each station can do from one to six pieces of work. Of course, if station one processes five pieces of work on day one, station two can only process, at maximum, five, because it only has five pieces available to 'pull.' Experiment with different values to see how the factory operates.\n\n"

print "How many days? "
STDOUT.flush
num_days = gets

print "How many work stations? "
STDOUT.flush
num_stations = gets


config = FactorySim::FactoryConfig.new(1, num_days.to_i(), num_stations.to_i(), 1)
fact = FactorySim::Factory.new(config)
fact.show_status


num_done = 0
for i in 1..num_days.to_i()
  fact.roll_one_round()
  puts " "
  fact.show_status()
end




