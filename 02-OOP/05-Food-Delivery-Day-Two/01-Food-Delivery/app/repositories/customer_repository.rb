require_relative 'base_repository'

class CustomerRepository < BaseRepository
  def create(item)
    item.id = @next_id
    @elements << item
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @elements.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
