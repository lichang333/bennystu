# # TODO: you can build your christmas list program here!
# puts Welcome to your Christmas gift list
# gifts = []
# while leaving != true do
#   puts Which action [list|add|delete|quit]?
#   action = gets.chomp
#   result = case action
#   when "list"
#     puts gifts
#   when "add"
#     puts "what would you like to add?"
#     new_item = gets.chomp
#     gifts << new_item
#     puts "gift added"
#   when "delete"
#     puts "type the number of the gift you would like to delete"
#     puts gifts
#     gifts.delete[gets.chomp]
#   when "quit"
#     leaving = true
#     puts "Goodbye"
#   else
#     "shouldn't be here"
#   end
# end

# TODO: you can build your christmas list program here!
puts "Welcome to your Christmas gift list"
gifts = []
leaving = false
while leaving != true do
  puts "Which action [list|add|delete|quit]?"
  action = gets.chomp
  if action == "list"
    (gifts.nil?) ? (puts "nothing in list!") : (puts gifts)
  elsif action == "add"
    puts "what would you like to add?"
    new_item = gets.chomp
    gifts << new_item
    puts "gift added"
  elsif action == "delete"
    puts "type the number of the gift you would like to delete"
    puts gifts
    user_index = gets.chomp
    gifts = gifts.delete(user_index)
  elsif action == "quit"
    leaving = true
    puts "Goodbye"
  else
    "shouldn't be here"
  end
end
