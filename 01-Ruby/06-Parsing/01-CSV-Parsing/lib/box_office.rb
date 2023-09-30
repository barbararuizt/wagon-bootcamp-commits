require 'csv'

def most_successful(number, max_year, file_path)
  mov = []

  CSV.foreach(file_path) do |row|
    year = row[1].to_i
    mov << { name: row[0], year: year, earnings: row[2].to_i } if year < max_year
  end

  mov.sort_by { |hsh| -hsh[:earnings] }.first(number)
  # TODO: return an array of most successful movies before `max_year`
end
