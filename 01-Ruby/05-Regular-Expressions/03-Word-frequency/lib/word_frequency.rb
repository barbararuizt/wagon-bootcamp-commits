def most_common_words(file_name, stop_words_file_name, number_of_word)
  count = Hash.new(0)
  arr = []

  File.open(stop_words_file_name, "r").each_line { |line| arr << line.chomp.to_s }

  File.open(file_name, "r").each_line do |line|
    words = line.chomp.downcase.split(/\W+/)
    words.each { |word| count[word] += 1 unless arr.include?(word) }
  end

  count = count.sort_by { |_key, value| -value }
  count.first(number_of_word).to_h
end
