def sum_odd_indexed(array)
  # TODO: computes the sum of elements at odd indexes (1, 3, 5, 7, etc.)
  # You should use Enumerable#each_with_index
  sum = 0
  array.each_with_index do |it, ind|
    sum += it if ind.odd?
  end
  return sum
end

def even_numbers(array)
  # TODO: Return the even numbers from a list of integers.
  #       You should use Enumerable#select
  new_array = array.select do |i|
    i.even?
  end
  return new_array
end

def short_words(array, max_length)
  # TODO: Take an array of words, return the array of words not exceeding max_length characters
  #       You should use Enumerable#reject
  new_array = array.reject do |i|
    i.length > max_length
  end
  return new_array
end

def first_under(array, limit)
  # TODO: Return the first number from an array that is less than limit.
  # You should use Enumerable#find
  new_array = array.find do |i|
    i < limit
  end
  return new_array
end

def add_bang(array)
  # TODO: Take an array of strings and return a new array with "!" appended to each string.
  #       You should use Enumerable#map
  new_array = array.map do |i|
    "#{i}!"
  end
  return new_array
end

def concatenate(array)
  # TODO: Concatenate all strings given in the array.
  #       You should use of Enumerable#reduce
  new_array = array.reduce("") do |i, k|
    i + k
  end
  return new_array
end

def sorted_pairs(array)
  # TODO: Reorganize an array into slices of 2 elements, and sort each slice alphabetically.
  #       You should use of Enumerable#each_slice
  new_array = []
  array.each_slice(2) do |i|
    new_array << i.sort
  end
  return new_array
end
