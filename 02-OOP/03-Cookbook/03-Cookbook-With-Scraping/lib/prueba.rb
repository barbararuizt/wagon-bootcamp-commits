require "nokogiri"
require "open-uri"

url = "https://www.allrecipes.com/search?q=chocolate"
doc = Nokogiri::HTML.parse(URI.open(url).read, nil, "utf-8")
elem = doc.search(".card__title")
elem.each { |title| puts title.text.strip }
p "hello"
# elem.each { |title| @titles << title.text.strip }