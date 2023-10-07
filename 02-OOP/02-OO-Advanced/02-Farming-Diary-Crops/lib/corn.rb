# TODO: code the Corn class
require_relative "crop"

class Corn < Crop
  attr_reader :grains

  def water!
    super(10)
  end
end
