require_relative "compute_name"
require "pry"

user_first_name = "first name"
user_middle_name = "middle name"
user_last_name = "last name"
names = [user_first_name, user_middle_name, user_last_name]
names.each_with_index do |value, index|
  puts "what is your #{value}?"
  names[index] = gets.chomp
end

puts compute_name(names[0], names[1], names[2])






