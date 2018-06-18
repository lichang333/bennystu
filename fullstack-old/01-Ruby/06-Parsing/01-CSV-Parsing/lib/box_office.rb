require 'csv'
require 'pry'

# def most_successful(file_path)
#   # TODO: return the number most successful movies before max_year
#   movies_hash = {}
#   keys = ["name", "year", "earnings"]
#   count = 0
#   array_with_keys = []

#   CSV.foreach(file_path) do |row|
#   # Here, row is an array of columns
#     array_of_values = row
#     row.each_with_index do |entry, i|
#       if i % 2 == 0 || i == 0
#        array_of_values.insert(i, keys[count])
#        count < 2 ? count += 1 : count = 0
#       else
#         "nothing"
#       end
#     end
#     array_with_keys << array_of_values
#   end
#   a = array_with_keys.flatten
#   binding.pry
#   Hash[a]
# end

# p most_successful("lib/movies.csv")


def most_successful(number, max_year, file_path)
  movie_array = []
  CSV.foreach(file_path) do |row|
    movie_array << { name: row[0], year: row[1].to_i, earnings: row[2].to_i } if row[1].to_i < max_year
  end
  movie_array.max_by(number) { |movie| movie[:earnings] }
end
