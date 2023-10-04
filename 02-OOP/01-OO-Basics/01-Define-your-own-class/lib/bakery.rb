class Bakery
  def initialize(bread, filling, topping)
    @bread = bread
    @filling = filling
    @topping = topping
  end

  def rot
    @status = "rotten"
  end
end
