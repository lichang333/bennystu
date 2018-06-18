require "pry"

def anagrams?(a_string, another_string)
  # TODO: implement the obvious method to test if two words are anagrams
  array1 = a_string.downcase.gsub(/[^a-z]/i, '').split(//)
  array2 = another_string.downcase.gsub(/[^a-z]/i, '').split(//)
  # p array1
  # p array2
  array1 = array1.sort
  array2 = array2.sort

  array1 == array2
end

def make_hash(string)
  keys = string.downcase.gsub(/[^a-z]/i, '').split(//).uniq
  values = keys.map { |i| string.downcase.count(i) }
  Hash[keys.zip(values)]
end

def anagrams_on_steroids?(a_string, another_string)
  # TODO: implement the improved method
  a_string_hash = make_hash(a_string)
  another_string_hash = make_hash(another_string)
  mismatch = 0
  another_string_hash.each do |key, value|
    mismatch += 1 if value != a_string_hash[key]
  end
  mismatch.zero?




  # binding.pry
  # count = 0
  # a_string.each_char do |letter|
  #   if another_string.match(/[#{letter}]{1}/)
  #     count += 1
  #   end
  # end
  # puts count == another_string.length ? true : false
end

anagrams_on_steroids?("Monica Lewinsky!", "Nice silky woman")


# ? true : false
