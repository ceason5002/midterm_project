class TrackingEvent
  attr_reader :status, :location, :timestamp, :notes

  def initialize(status, location, timestamp: Time.now, notes: nil)
    @status = status
    @location = location
    @timestamp = timestamp
    @notes = notes
  end

  def to_s
    note_text = @notes ? " (#{@notes})" : ""
    "[#{@timestamp.strftime('%Y-%m-%d %H:%M:%S')}] #{@status} at #{@location}#{note_text}"
  end
end


#created tracking ability