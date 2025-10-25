require_relative "standard_package"

class ExpressPackage < StandardPackage
  EXPRESS_MULTIPLIER = 1.5

  def cost
    (BASE_RATE + @weight * RATE_PER_KG) * EXPRESS_MULTIPLIER
  end
end

#creates a express pacakage that uses the standard package but multiplies it by 1.5