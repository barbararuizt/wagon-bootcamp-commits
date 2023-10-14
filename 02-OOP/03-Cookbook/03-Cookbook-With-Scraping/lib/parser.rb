require "nokogiri"
require "open-uri"
#file = "strawberry.html"}
# ingredient = "strawberry"

class Parser
  def initialize(ingredient)
    @ingredient = ingredient
    @titles = Array.new
    @url = "https://www.allrecipes.com/search?q=#{@ingredient}"
    @doc = Nokogiri::HTML.parse(URI.open(@url).read, nil, "utf-8")
  end

  def search
    elem = @doc.search(".card__title")
    elem.each { |title| @titles << title.text.strip }
    @titles[0..4]
  end
end

# parser = Parser.new(ingredient)
# parser.search
