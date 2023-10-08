def horse_racing_format!(race_array)
  race_array.reverse!.map! do |horse|
    "#{race_array.size - race_array.index(horse)}-#{horse}!"
  end
  race_array
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
end
