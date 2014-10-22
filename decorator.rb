require 'delegate'

class Coffee
  def cost
    2
  end

  def origin
    "Colombia"
  end
end


class Milk < SimpleDelegator
  def cost
    super + 0.4
  end

  def origin
    super.upcase
  end
end

coffee = Coffee.new
puts Milk.new(coffee).cost   # 2.6
puts Milk.new(coffee).origin
