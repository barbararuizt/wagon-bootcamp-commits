require 'open-uri'
require 'json'

def generate_grid(grid_size)
  grid = []
  (1..grid_size).each { |_n| grid << ('A'..'Z').to_a.sample }
  grid
  # TODO: generate random grid of letters
end

def grid?(grid, word)
  word.chars.all? { |letter| grid.count(letter.upcase) >= word.count(letter) }
end

def run_game(attempt, grid, start_time, end_time)
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  serialized = URI.open(url).read
  check = JSON.parse(serialized) # se hace Hash {"found"=>true, "word"=>"apple", "length"=>5}

  calc_time = end_time - start_time
  results = { time: calc_time, score: 0, message: "not an english word or not in the grid" }

  if check["found"] == true && grid?(grid, attempt) == true
    results[:score] = 80 - calc_time + attempt.size
    results[:message] = "Yeah! Well done"
  end
  results
end
