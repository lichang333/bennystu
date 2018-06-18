

def coach_answer(your_message)
  satisfactory2 = "I am going to work right now!"
  # TODO: return coach answer to your_message
  if your_message[-1] == "?"
    "Silly question, get dressed and go to work!"
  elsif your_message.downcase == satisfactory2.downcase
    ""
  else
    "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  satisfactory2 = "I am going to work right now!"
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if your_message.downcase == satisfactory2.downcase
    ""
  elsif your_message == your_message.upcase
    return "I can feel your motivation! " + coach_answer(your_message)
  else
    coach_answer(your_message)
  end
end

