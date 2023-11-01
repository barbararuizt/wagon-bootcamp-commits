require 'csv'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository
  def all_riders
    @elements.select { |employee| employee.rider? }
  end

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'username', 'password', 'role']
      @elements.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end
end
