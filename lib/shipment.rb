require_relative "tracking_event"

class Shipment
  attr_reader :tracking_number

  def initialize(package, notifier)
    @package = package
    @notifier = notifier
    @tracking_number = "TRK#{Time.now.to_i}#{rand(1000..9999)}"
    @events = []
  end

  def current_status
    @events.empty? ? "not_yet_shipped" : @events.last.status
  end

  def history
    @events.dup
  end

  def update_status(status, location, notes: nil, timestamp: Time.now)
    event = TrackingEvent.new(status, location, timestamp: timestamp, notes: notes)
    @events << event
    @notifier.send_update(self, event)
  end

  def estimated_cost
    @package.cost
  end

  private

  attr_reader :package, :notifier, :events
end

# creates shipment using the trackig even file
# including status, history, and estimated cost
# ability to update status 