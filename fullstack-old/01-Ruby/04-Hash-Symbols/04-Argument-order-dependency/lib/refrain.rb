def refrain(lyrics, number_of_times = 1, vibrato = 0, strong = false)
  refrain = []
  lyrics += lyrics[lyrics.size - 1] * vibrato
  lyrics.upcase! if strong

  number_of_times.times do
    refrain << lyrics
  end

  refrain.join(" ")
end

def better_refrain(lyrics, options = { vibrato: 0, number_of_times: 1, strong: false })
  refrain = []
  lyrics += lyrics[lyrics.size - 1] * options[:vibrato]
  lyrics.upcase! if options[:strong]

  options[:number_of_times].times do
    refrain << lyrics
  end

  refrain.join(" ")
end

# p better_refrain("knock knock knockin' on heaven's door", options = { vibrato: 1, number_of_times: 2, strong: false })
