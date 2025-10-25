#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

#uses each file created (it has a specifed filepath above)
require "packages/standard_package"
require "packages/express_package"
require "packages/overnight_package"
require "shipment"
require "notifiers/console_notifier"
require "notifiers/sms_notifier"
require "notifiers/email_notifier"

#creation of each package
standard = StandardPackage.new(3, "Dallas", "Austin", "Alice", "Bob")
express = ExpressPackage.new(2, "Houston", "San Antonio", "Cathy", "Dan")
overnight = OvernightPackage.new(1, "El Paso", "Lubbock", "Eve", "Frank")

#test
puts standard
puts express
puts overnight

puts "Standard cost: $#{standard.cost}"
puts "Express cost: $#{express.cost}"
puts "Overnight cost: $#{overnight.cost}"
puts "-" * 50

notifier = ConsoleNotifier.new
shipment = Shipment.new(express, notifier)
shipment.update_status("picked_up", "Houston")
sleep 1
shipment.update_status("in_transit", "San Marcos")
sleep 1
shipment.update_status("delivered", "San Antonio")

puts "Final status: #{shipment.current_status}"
