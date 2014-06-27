require_relative '../lib/factory_sim.rb'
require 'minitest/autorun'

class TestFactory < MiniTest::Test

 def test_that_one_station_averages_three_point_five
   @config = FactorySim::FactoryConfig.new(1000,1,1,1)
   @fact = FactorySim::FactoryFactory.new(@config)
   @fact.do_rolls
   assert_equal(true, @fact.total>3300 && @fact.total<3700)
   assert_equal(3, @fact.average)
 end

 def test_ten_ten_one_is_about_eighteen
   @config = FactorySim::FactoryConfig.new(10000,10,10,1)
   @fact = FactorySim::FactoryFactory.new(@config)
   @fact.do_rolls
   assert_equal(true, @fact.total>170000 && @fact.total<190000) 
   assert_equal(18, @fact.average)
 end
end
