require_relative "coach_answer"

inpt = gets.chomp

until inpt.downcase == 'i am going to work right now!'

  if inpt == inpt.upcase
    puts coach_answer_enhanced(inpt)
  else
    puts coach_answer(inpt)
  end

  inpt = gets.chomp
end


# TODO: Implement the program that makes you discuss with your coach from the terminal.
