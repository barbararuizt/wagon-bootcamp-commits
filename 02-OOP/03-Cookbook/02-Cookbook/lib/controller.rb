#  TODO: Define your Controller Class here, to orchestrate the other classes
require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_list(@cookbook.all)
  end

  def add
    name = @view.ask_for_name
    description = @view.ask_for_description
    @cookbook.create(Recipe.new(name, description))
  end

  def remove
    index = @view.ask_for_index
    @cookbook.destroy(index)
  end
end
