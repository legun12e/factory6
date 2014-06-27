
The Factory Simulation
From CIO.com, uploaded by (name), based on the work of Matthew Heusser Matt@xndev.com

Distributed under the GNU GPL 2.0 license: http://choosealicense.com/licenses/gpl-2.0/

Imagine a factory that has a number of stations. Each day, work proceeds through the stations.

The stations have high variability but are balanced. We simulate this with a six sided die. Users enter the number of stations and days and the application shows how work processes. The advan
ced version, factory_multi3.rb allows you to simulate muliple runs of the factory (run it a thousand times and take the averages) or change the number of dice.

## Dependencies
This code developed and tested under ruby 2.0.0p247. As long as you have ruby 1.9.3 or higher you should be fine.


## Running the Simulation
1. `cd this/project/directory`
2. `ruby factory.rb` or `ruby factory_multi3.rb`

## Running the Tests

1. `ruby test/run_all.rb`

