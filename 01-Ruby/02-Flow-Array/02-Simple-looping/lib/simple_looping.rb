def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  x = 0
  min > max ? x = -1 : for i in min..max do x = x + i end
  x
end

def sum_with_while(min, max)
  return -1 if min > max

  x = min
  value = 0

  while x <= max
    value += x
    x += 1
  end

  value
end
