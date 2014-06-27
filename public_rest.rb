
require "open-uri"
require 'rexml/document'
include REXML

class Customer
    attr_accessor :customerid
    attr_accessor :firstname
    attr_accessor :lastname


  def initialize(customerid)
    @customerid=customerid
    url = "http://www.thomas-bayer.com/sqlrest/CUSTOMER/"
    data_from_url = URI.parse(url+ customerid.to_s()).read
    xmldoc = Document.new(data_from_url)  
    @firstname = XPath.first(xmldoc, "//CUSTOMER/FIRSTNAME").text    
    @lastname = XPath.first(xmldoc, "//CUSTOMER/LASTNAME").text
   end 
end

#-----------------------------------#
#           "Main Routine"          #
#-----------------------------------#

print "What is your userid? "
	STDOUT.flush
	customerid = gets

customer = Customer.new(customerid.chomp)

puts "Your name is " + customer.firstname + " " + customer.lastname

