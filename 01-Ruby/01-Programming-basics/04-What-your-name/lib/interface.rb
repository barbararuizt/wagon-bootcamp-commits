require_relative "compute_name"

# TODO: ask for the first name
first = gets.chomp

# TODO: ask for the middle name
middle = gets.chomp

# TODO: ask for the last name
last = gets.chomp

# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"
full = compute_name(first, middle, last)

puts "Grettings, #{full} . I wish you a very Merry Christmas!"
