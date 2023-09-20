require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  "Your score is: #{player_score} \nBank's score is: #{bank_score}"
  # TODO: return (not print!) a message containing the player's score and bank's score
end

def end_game_message(player_score, bank_score)
  if player_score > 21 || player_score < bank_score
    "Sorry :( You lost"
  elsif player_score == 21
    "Black Jack :D"
  elsif player_score > bank_score
    "You won!"
  elsif player_score == bank_score
    "Push :o"
  end
  # TODO: return (not print!) a message telling if the user won or lost.
end
