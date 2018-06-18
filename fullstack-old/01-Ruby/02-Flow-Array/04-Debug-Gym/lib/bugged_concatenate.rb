def bugged_concatenate(array)
  concatenated_string = ""
  array.each do |element|
    concatenated_string += element
  end
  return concatenated_string.upcase
end

def build_1984_title
  array = [1, "9", 84, " ", "George Orwell"]
  new_array = []
  array.map do |element|
    new_array << element.to_s
  end
  # new_array.each do |i|
  #   puts i.class
  # end

  bugged_concatenate(new_array)
end

# puts build_1984_title
