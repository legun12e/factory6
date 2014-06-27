require_relative 'lib/factory_sim.rb'



#-------------------------------------#
#            Main Routine             #
#-------------------------------------#

puts "\n\n"
puts "This game simulates a single factory with multiple workstations. In a given day the work can process through every workstation, and each station can do from one to six pieces of work. Of course, if station one processes five pieces of work on day one, station two can only process, at maximum, five, because it only has five pieces available to 'pull.' Experiment with different values to see how the factory op
erates.\n\n"
puts "If you think the results may be random, you are right, so we'll go further, doing a simulation of as many factories as you would likethen averaging the results.\n\n"

print "How many factories would you like to run (then get averages reported)? "
STDOUT.flush
num_factories = gets

print "How many days? "
STDOUT.flush
num_days = gets

print "How many work stations? "
STDOUT.flush
num_stations = gets

print "How many dice per work station? "
STDOUT.flush
num_dice = gets

config = FactorySim::FactoryConfig.new(num_factories.to_i(), num_days.to_i(), num_stations.to_i(), num_dice.to_i())
fact = FactorySim::FactoryFactory.new(config)
fact.do_rolls

puts "\n\n"
puts "Total outcome: "+ fact.total.to_s()
puts "Average outcome: " + fact.average.to_s()
puts "\n"
