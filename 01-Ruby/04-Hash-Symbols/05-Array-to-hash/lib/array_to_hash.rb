def array_to_hash(array)
  # TODO: implement the method :)
  hash = {}
  array.each_with_index do |value, id|
    if block_given?
      hash["key#{id}"] = value
    else
      hash[id.to_s] = value
    end
  end

  hash
end
