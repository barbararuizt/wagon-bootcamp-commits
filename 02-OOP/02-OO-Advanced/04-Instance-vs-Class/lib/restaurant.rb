class Restaurant
  attr_reader :city, :name, :average_rating

  # TODO: add relevant accessors if necessary

  def initialize(city, name)
    @city = city
    @name = name
    @total_ratings = 0
    @sum_ratings = 0
    # TODO: implement constructor with relevant instance variables
  end

  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @total_ratings += 1 # acumula cosas al ser el mismo objeto
    @sum_ratings += new_rate
    @average_rating = @sum_ratings / @total_ratings
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |restaurant| restaurant.city == city }
  end
end
