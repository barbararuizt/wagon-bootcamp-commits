require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
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
