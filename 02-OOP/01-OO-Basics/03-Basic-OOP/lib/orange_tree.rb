# require "pry-byebug"

class OrangeTree
  attr_accessor :age, :dead, :height, :fruits

  def initialize
    @age = 0
    @dying_prob = 0
    @dead = false
    @height = 0
    @fruits = 0
  end

  def dead?
    @dead
  end

  def one_year_passes!
    @fruits = 0

    may_die

    if @dead == false
      @age += 1
      @height += 1 if @age <= 10
      @fruits += 100 if @age > 5 && @age < 10
      @fruits += 200 if @age >= 10 && @age < 15
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits.positive?
  end

  private

  def may_die
    if @age >= 50
      random = (@age..100).to_a.sample # recordar usar ()
      @dead = true if random == @age || @age >= 100
    end
  end
  # TODO: Implement all the specs defined in the README.md :)
end
