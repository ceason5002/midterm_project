require_relative "standard_package"

class OvernightPackage < StandardPackage
  OVERNIGHT_FEE = 20.0

  def cost
    BASE_RATE + @weight * RATE_PER_KG + OVERNIGHT_FEE
  end
end

#creates a overnight pacakage that uses the standard package but gives a extra fee for overnight accent