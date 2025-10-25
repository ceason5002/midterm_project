class SMSNotifier
  def initialize(phone)
    @phone = phone
  end

  def send_update(shipment, event)
    puts "[SMS to #{@phone}]: Your package #{shipment.tracking_number} " \
         "is now #{event.status} at #{event.location} (#{event.timestamp.strftime('%H:%M')})"
  end
end

#uses the shipkment class to update buyer via phone number