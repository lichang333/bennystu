require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
satisfactory = "I am going to work right now!"
puts "what do you say to your coach?"
your_words = gets.chomp
if your_words.downcase == satisfactory.downcase
  puts ""
else
  until your_words.downcase == satisfactory.downcase
    puts coach_answer_enhanced(your_words)
    puts "what do you say to your coach?"
    your_words = gets.chomp
  end
end


