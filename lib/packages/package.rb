class Package
  attr_reader :weight, :origin, :destination, :sender, :recipient

  def initialize(weight, origin, destination, sender, recipient)
    @weight = weight
    @origin = origin
    @destination = destination
    @sender = sender
    @recipient = recipient
    raise ArgumentError, "Weight must be positive" if @weight <= 0
  end
#Cost method
  def cost
    raise NotImplementedError, "Subclasses must implement cost"
  end
# turns cost
  def to_s
    "#{self.class.name}: #{@weight}kg from #{@origin} to #{@destination} (#{@sender} → #{@recipient})"
  end
end
