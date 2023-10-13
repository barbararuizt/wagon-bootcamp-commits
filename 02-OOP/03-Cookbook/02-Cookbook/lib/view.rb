# TODO: Define your View class here, to display elements to the user and ask them for their input
require_relative "recipe"

class View
  def display_list(recipes)
    puts "Here is your list of recipes:"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for_name
    puts "What is the name of the recipe?" # se puede combinar en una sola con parametros para el puts
    gets.chomp
  end

  def ask_for_description
    puts "What is the description of the recipe?"
    gets.chomp
  end

  def ask_for_index
    puts "What is the index of the recipe you want to remove?"
    gets.chomp.to_i - 1
  end
end
