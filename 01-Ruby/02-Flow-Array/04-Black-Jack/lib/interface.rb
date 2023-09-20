require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card
inpt = gets.chomp
user = 0
bank = pick_bank_score
user += pick_player_card

while inpt.include("y")?

  if user >= 21
    puts end_game_message(user, bank)
  else
    puts state_of_the_game(user, bank)
  end

  user = user + pick_player_card
  inpt = gets.chomp
end

puts end_game_message(user, bank) if user != 21 || user > 21
