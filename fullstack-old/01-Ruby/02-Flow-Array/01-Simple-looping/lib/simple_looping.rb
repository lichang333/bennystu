

def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  return -1 if min > max

  sum = 0

  array = (min..max).to_a
  for num in array
    sum += num
  end
  return sum
end

def sum_with_while(min, max)
  return -1 if min > max
  array = (min..max).to_a
  sum = 0
  counter = 0
  while counter != array.size
    sum += array[counter]
    counter += 1
  end
  return sum
end
