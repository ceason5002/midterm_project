class EmailNotifier
  def initialize(email)
    @email = email
  end

  def send_update(shipment, event)
    puts "To: #{@email}"
    puts "Subject: Update for Shipment #{shipment.tracking_number}"
    puts "Body: Your package is #{event.status} at #{event.location} " \
         "on #{event.timestamp.strftime('%Y-%m-%d %H:%M:%S')}"
    puts "-" * 40
  end
end

# ability to send updates using the shipment and even class