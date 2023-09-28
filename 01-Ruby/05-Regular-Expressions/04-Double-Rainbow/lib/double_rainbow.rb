def word_contains_at_least_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's or more
  regexp = /(\b\w*p\w*p\w*\b)/
  sentence.match(regexp)[0]
end

def word_before_exclamation_mark(sentence)
  regexp = /(\b\w*\b)!/
  sentence.match(regexp)[0][..-2]
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
end

def four_letter_word(sentence)
  regexp = /(\bb\w{3}\b),/
  sentence.match(regexp)[0][..-2]
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
end

def last_five_letters(sentence)
  regexp = /\w{5}$/
  sentence.match(regexp)[0]
  # TODO: return the last five letters of the sentence
end

def word_contains_ll(sentence)
  regexp = /\b\w*ll\w*\b/
  sentence.match(regexp)[0]
  # TODO: return the first word containing two consecutive 'l'
end

def six_letter_word(sentence)
  regexp = /\b[a-r]{6}\b/
  sentence.match(regexp)[0]
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
end

def all_capital_letters(sentence)
  regexp = /[A-Z]/
  sentence.scan(regexp).join
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurences then `join` them
end
