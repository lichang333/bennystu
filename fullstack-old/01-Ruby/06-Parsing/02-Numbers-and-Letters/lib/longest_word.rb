require 'open-uri'
require 'json'
require 'pry'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  grid = []
  grid_size.times { grid << ("A".."Z").to_a.sample }
  grid.flatten
  # grid = %w(W G G Z O N A L)
  # grid
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  # Check word exists and is in grid
  attempt = attempt.upcase
  time = time(start_time, end_time)
  if actual_word(attempt) && letters_in_grid(attempt, grid)
    score = calc_score(time, attempt)
    message = "Well done, #{attempt} is a great word"
    create_hash(time, score, message)
  elsif actual_word(attempt) == false
    score = 0
    message = "not an english word"
    create_hash(time, score, message)
  else letters_in_grid(attempt, grid) == false
    score = 0
    message = "#{attempt} is not in the grid"
    create_hash(time, score, message)
  end
end

def actual_word(attempt)
  api_response = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{attempt}").read)
  api_response["found"]
end

def letters_in_grid(attempt, grid)
  includes = []
  attempt.split(//).each do |letter|
    if grid.include? letter
      includes << letter
      grid.delete_at grid.index(letter) unless grid.index(letter).nil?
      # p includes
    end
  end
  attempt.split(//).sort == includes.sort
end

def calc_score(time, attempt)
  # binding.pry
  (1 / time) * attempt.size * 100
  # attempt.size - time
end

def time(start_time, end_time)
  end_time - start_time
end

def create_hash(time, score, message)
  { time: time, score: score, message: message }
end
