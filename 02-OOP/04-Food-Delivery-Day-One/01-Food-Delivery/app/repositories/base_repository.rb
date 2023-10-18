require 'csv'

# class SaveLoad

#   def initialize(csv_file)
#     @csv_file = csv_file
#   end

#   def load_csv(elements, subtitle)
#     CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
#       row[:id] = row[:id].to_i
#       row[subtitle] = row[subtitle].to_i
#       elements << Meal.new(row)
#     end
#     @next_id = elements.empty? ? 1 : elements.last.id + 1
#   end

#   def save_csv(elements, titles)
#     CSV.open(@csv_file, 'wb') do |csv|
#       csv << titles

#       if titles.include?('price')
#         elements.each do |meal|
#           csv << [meal.id, meal.name, meal.price]
#         end
#       else
#         elements.each do |item|
#           csv << [item.id, item.name, item.address]
#         end
#       end
#     end
#   end
# end

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(item)
    item.id = @next_id
    @elements << item
    @next_id += 1
    save_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |item| item.id == id }
  end

  def delete(id)
    @elements.delete(find(id))
    save_csv
  end
end
