require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  return "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score > bank_score && player_score < 21
    "You beat the bank! You win."
  elsif bank_score == player_score
    "Push"
  elsif player_score == 21
    "Black Jack"
  else
    "You lost, too bad."
  end
end

def play_game
  bank_score = pick_bank_score
  player_score = 0
  # new_card = nil

  while player_score <= 21
    puts "Card? 'y' or 'yes' to get a new card"
    new_card = gets.chomp
    if new_card.include? ["y", "yes"]
      player_score += pick_player_card
      if player_score <= 21
        puts state_of_the_game(player_score, bank_score)
      else
        puts state_of_the_game
        puts end_game_message(player_score, bank_score)
      end
    else
      puts end_game_message(player_score, bank_score)
      player_score = 100
    end


  end
end
