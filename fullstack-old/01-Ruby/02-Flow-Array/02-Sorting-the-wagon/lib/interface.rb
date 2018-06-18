require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.4.0/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.4.0/String.html#method-i-chomp
puts "Type a student name:"
name = gets.chomp
students = []

while name != ""
  students << name
  puts "Type another student name:"
  name = gets.chomp
end
wagon_sort(students)

list_pt2 = " and " + students.pop
string = students.join(", ") + list_pt2
puts "Congratulations! Your Wagon has #{students.size + 1} students:\n - #{string}"



# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
