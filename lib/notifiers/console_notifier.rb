class ConsoleNotifier
  def send_update(shipment, event)
    puts "📦 [#{event.timestamp.strftime('%Y-%m-%d %H:%M:%S')}] " \
         "Shipment #{shipment.tracking_number}: #{event.status} at #{event.location}"
  end
end

#send a update using the shipment and event class