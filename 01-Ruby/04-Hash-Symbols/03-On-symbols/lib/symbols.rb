# NOTE: Read about BasicObject#object_id
# https://ruby-doc.org/core-2.7.5/BasicObject.html#method-i-__id__

# You can try launching `irb` to test some values
# irb> :foo.object_id
# irb> :foo.object_id
# irb> "foo".object_id
# irb> "foo".object_id

def are_identical_symbols_same_objects?
  true
  # TODO: Answer the question by making this method to return true or false
end

def are_identical_strings_same_objects?
  false
  # TODO: Answer the question by making this method to return true or false
end


# Remember, RTFM! Your doc is your friend
# - https://ruby-doc.org/core-2.7.5/String.html
# - https://ruby-doc.org/core-2.7.5/Symbol.html

def convert_string_to_symbol(a_string)
  a_string.to_sym
  # TODO: return the symbol version of the parameter `a_string` passed to this method
end

def convert_symbol_to_string(a_symbol)
  a_symbol.to_s
  # TODO: return the string version of the parameter `a_symbol` passed to this method
end

def me
  {
    age: 21,
    name: "barbara",
    hobby: "my cat"
  }
  # TODO: return a Hash representing yourself, with keys such as age and name
end

def fruits
  ["apple", "pear", "watermelon"]
  # TODO: return an array of fruits
end
