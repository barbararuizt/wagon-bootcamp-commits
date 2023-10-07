class Crop
  attr_reader :grains

  def initialize
    @grains = 0
  end

  def water!(add_grains)
    @grains += add_grains
  end

  def ripe?
    @grains >= 15
  end
end
