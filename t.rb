File.open("data.txt", "r") do |file|
  file.each_line do |line|
   line.sub!(/^616\-3/,"269-3")
    puts line
  end
end 


array3 = Array[1,2,3,4,5]

array3.each do |value|
  puts value.to_s()
end


for value in array3
  puts value.to_s()
end


print "What is your name? "
STDOUT.flush
name = gets
if name == "cheesy"
  puts "You don’t need this tutorial!"
else
  puts "Hello " + name
end


