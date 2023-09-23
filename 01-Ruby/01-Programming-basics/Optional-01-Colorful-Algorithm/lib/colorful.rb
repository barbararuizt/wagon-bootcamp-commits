def duplicates(array)
  dupes = []
  array.each do |e|
    dupes << e if array.count(e) > 1
  end

  dupes.empty?
end

def colorful?(number)
  arr = number.to_s.chars

  if number.class != Integer
    false

  elsif number < 10
    true

  elsif arr.size == 2
    x = arr[0].to_i
    y = arr[1].to_i
    comp = [x, y, x * y]
    duplicates(comp)

  elsif arr.size == 3
    x = arr[0].to_i
    y = arr[1].to_i
    z = arr[2].to_i
    comp = [x, y, z, x * y, y * z, x * y * z]
    duplicates(comp)

  end
end
