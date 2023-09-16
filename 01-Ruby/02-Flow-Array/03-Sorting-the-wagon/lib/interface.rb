require_relative "wagon_sort"

puts "Type a student name:"
inpt = gets.chomp
a = []
amt = 0

while inpt != "" # creo que este no funciona pq no imprime de vuelta el ""
  a << inpt
  puts "Type another student name or press enter to finish:"
  inpt = gets.chomp
  amt += 1
end

list = wagon_sort(a)
listxt = "#{list[0..-2].join(', ')} and #{list[-1]}"

puts "#{list.size} students"

if a.empty?
  puts ""
elsif a.length == 1
  puts list[0]
else
  puts "Congratulations! Your Wagon has #{amt} students: #{listxt}"
end
# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
