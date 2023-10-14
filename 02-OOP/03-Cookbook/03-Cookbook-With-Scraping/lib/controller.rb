#  TODO: Define your Controller Class here, to orchestrate the other classes
require_relative "view"
require_relative "recipe"
require_relative "parser"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_list(@cookbook.all)
  end

  def add
    puts "What is the name of the recipe?" 
    name = @view.ask
    puts "What is the description of the recipe?"
    description = @view.ask
    @cookbook.create(Recipe.new(name, description))
  end

  def remove
    puts "What is the index of the recipe you want to remove?"
    index = @view.ask.to_i - 1
    @cookbook.destroy(index)
  end

  def import
    ingredient = @view.search
    puts "\nSearching for #{ingredient} recipes..."

    titles = Parser.new(ingredient).search

    @view.display_search(titles)
    puts "\nWhich recipe would you like to import?"

    index = @view.ask.to_i - 1
    recipe = Recipe.new(titles[index], "N/A")
    @cookbook.create(recipe)
  end
end
