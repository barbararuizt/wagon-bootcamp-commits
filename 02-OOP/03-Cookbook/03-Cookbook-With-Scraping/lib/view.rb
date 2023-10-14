# TODO: Define your View class here, to display elements to the user and ask them for their input
require_relative "recipe"

class View
  def display_list(recipes)
    puts "Here is your list of recipes:"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask
    gets.chomp
  end

  def search
    puts "What ingredient would you like a recipe for? "
    ask
  end

  def display_search(titles)
    titles.each_with_index do |title, index|
      puts "#{index + 1}. #{title}"
    end
  end
end
