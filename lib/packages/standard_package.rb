require_relative "package"

class StandardPackage < Package
  BASE_RATE = 5.0
  RATE_PER_KG = 2.5

  def cost
    BASE_RATE + @weight * RATE_PER_KG
  end
end

#creates a basic package (like foundation to build off of)