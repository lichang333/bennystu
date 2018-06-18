def timer_for
  # TODO: Return time taken to execute the given block
  start_time = Time.now
  yield
  end_time = Time.now
  end_time - start_time
end

def my_map(array)
  # TODO: Re-implement the same behavior as `Enumerable#map` without using it! You can use `#each` though.
  new_array = []
  array.each do |i|
    new_array << yield(i)
  end
  return new_array
end

def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]

  finish = "</#{tag_name}>"
  if attributes.nil?
    start = "<#{tag_name}>"
  else
    start = "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">"
  end
  return start + yield + finish
  # "<#{tag_name}>#{yield}</#{tag_name}>"
  # "<#{tag_name}>"+ yield +"</#{tag_name}>"
end


