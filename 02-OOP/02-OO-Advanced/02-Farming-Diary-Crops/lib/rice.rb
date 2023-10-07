# TODO: code the Rice class
require_relative "crop"

class Rice < Crop
  attr_reader :grains

  def water!
    super(5)
  end

  def transplant!
    @grains += 10
  end
end
