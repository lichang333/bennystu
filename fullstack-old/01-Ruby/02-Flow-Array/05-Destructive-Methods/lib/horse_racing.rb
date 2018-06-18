def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  count = 0
  # horse_array = []
  race_array.map! do |i|
    count += 1
    "#{count}-#{i}!"
    # horse_array << i
  end
  race_array.reverse!
end

puts horse_racing_format!(["Coup de Folie", "Abricot du Laudot", "Black Caviar", "Brigadier Gerard"])



