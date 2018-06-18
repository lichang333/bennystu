def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.

  array_selected = array.select do |i|
    i.size == size
  end

  array_not_selected = array.reject do |i|
    i.size == size
  end

  return [array_selected.sort, array_not_selected.sort]
end

def block_splitter(array)
  array_selected = array.select do |i|
    yield(i)
  end
  array_not_selected = array.reject do |i|
    yield(i)
  end
  return [array_selected, array_not_selected]
end
