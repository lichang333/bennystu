
# 2
def remove_punctuation(word_array)
  without_punc = []
  word_array.each do |word|
    without_punc << word.gsub(/[^a-zA-Z0-9\s]/i, '')
  end
  return without_punc
end

# 4
def define_punctuation(without_punc, word_array)
  punc_array = []
  word_array.each_with_index do |word, i|
    punc = word.slice((without_punc[i].size - word.size), word.size)
    punc_array << punc
  end
  return punc_array
end

# 5
def assemble_louchebem(reordered_word_array)
  suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"].sample
  reordered_word_array.map do |word|
    if word.size < 2
      word
    else
      "l#{word}#{suffix}"
    end
  end
end

# 3
def reorder_word(without_punc)
  reordered_word_array = []
  reorder_array = []
  without_punc.map do |word|
    reorder_array = word.split(/([aeiou].*)/)
    reorder_array[0], reorder_array[1] = reorder_array[1], reorder_array[0]
    new_word = reorder_array.join
    reorder_array = []
    reordered_word_array << new_word
  end
  return reordered_word_array
end

# 6
def add_punc(punc_array, louchebem_words)
  completed_array = []
  punc_array.each_with_index do |word, i|
    if word == word.gsub(/[^a-zA-Z0-9\s]/i, '')
      word = louchebem_words[i]
    else
      word = "#{louchebem_words[i]}#{word}"
    end
    completed_array << word
  end
  return completed_array
end

# 1
def split_sentence(sentence)
  sentence.split(" ")
end

def louchebemize(sentence)
  word_array = split_sentence(sentence)
  without_punc = remove_punctuation(word_array)
  reordered_word_array = reorder_word(without_punc)
  punc_array = define_punctuation(without_punc, word_array)
  louchebem_words = assemble_louchebem(reordered_word_array)
  punc_louchebem = add_punc(punc_array, louchebem_words)
  return punc_louchebem.join(" ")
end

