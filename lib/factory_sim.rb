

module FactorySim

  class OneDeeSix

    def roll
      @result = 1+rand(6)
      return @result
    end
  end

  class LoadedOneDeeSix
    attr_accessor :result
  
    def initialize(result)
      @result = result
    end
  
    def roll
      return @result
    end
  end
  
  class Workstation
    attr :queue
    attr_accessor :num_dice
    attr_accessor :die
  
    def initialize(num_dice, die=OneDeeSix.new())
      @num_dice = num_dice
      @die = die
      @queue = 0  
    end
    
    def roll
      result = 0
      for i in 1..@num_dice
        result = result + @die.roll()
      end
      if (result > @queue && @queue<6)
          result=@queue
      end
  
      @queue-=result
      return result
    end  
  
    def new_wip()
      @queue=@queue+1
    end
   
    def queue=(queue)
      @queue = queue
    end
  
    def queue_size
      @queue
    end
  
  end
  
  class Factory
    attr_accessor :factory_configs
    attr_accessor :num_processed
  
    def initialize(factory_configs)
      @num_processed = 0
      @factory_configs = factory_configs
      @stations = Array.new(factory_configs.num_stations_per_factory){|i|Workstation.new(factory_configs.num_dice)}
      @stations[0].queue = 100000000
    end
   
    def show_status()
      puts "Status: "
      index = 0
      @stations.each do |station|
        puts index.to_s() + "     " + station.queue_size().to_s() 
        index=index+1
      end
      
      puts "   "
      puts "num processed: " + @num_processed.to_s
      puts "   "
    end
  
    def roll_one_round
      num_out = 0
      idx = 0
      @stations.each do |station|
         num_out = station.roll
         idx+=1
         if !@stations[idx].nil?
           @stations[idx].queue+=num_out
         end
      end
      @num_processed+=num_out
    end
  
    def do_rolling
      for i in 1..factory_configs.num_rounds.to_i()
        roll_one_round()
      end
    end
  end
  
  
  class FactoryConfig
     attr_accessor :num_factories
     attr_accessor :num_stations_per_factory
     attr_accessor :num_rounds
     attr_accessor :num_dice
  
     def initialize(num_factories, num_rounds, num_stations_per_factory, num_dice)
         @num_factories = num_factories
         @num_stations_per_factory = num_stations_per_factory
         @num_dice = num_dice
         @num_rounds = num_rounds
     end
  
  
  end
  
  class FactoryFactory
    attr_accessor :total
    attr_accessor :average 
    attr_accessor :factory_configs
   
    def initialize(factory_configs)
      @factory_configs = factory_configs
      @factories = Array.new(factory_configs.num_factories){|i|Factory.new(factory_configs)}     
      @total = 0
      @average = 0
    end
  
    def do_rolls
      @factories.each do |fact|
        fact.do_rolling()
        @total = @total+fact.num_processed
      end
      @average = @total / @factory_configs.num_factories
    end 
    
  end
  
end
