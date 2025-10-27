require_relative "../lib/shipment"
require_relative "../lib/tracking_event"

# test using rspec for each method/ subclass of shipment and there respective notifers 
RSpec.describe Shipment do
  let(:package) { double("package", cost: 12.5) }
  let(:notifier) { double("notifier") }
  subject(:shipment) { Shipment.new(package, notifier) }

  it "generates tracking number starting with TRK" do
    expect(shipment.tracking_number).to match(/^TRK/)
  end

  it "returns 'not_yet_shipped' when no events" do
    expect(shipment.current_status).to eq("not_yet_shipped")
  end

  it "delegates estimated_cost to package" do
    expect(shipment.estimated_cost).to eq(12.5)
  end

  it "adds a tracking event and calls notifier" do
    expect(notifier).to receive(:send_update).once
    shipment.update_status("picked_up", "Dallas")
    expect(shipment.history.size).to eq(1)
    expect(shipment.current_status).to eq("picked_up")
  end

  it "preserves event order" do
    allow(notifier).to receive(:send_update)
    t1 = Time.now
    t2 = t1 + 10
    shipment.update_status("picked_up", "Houston", timestamp: t1)
    shipment.update_status("in_transit", "Austin", timestamp: t2)
    expect(shipment.history.first.timestamp).to eq(t1)
    expect(shipment.history.last.timestamp).to eq(t2)
  end
end
