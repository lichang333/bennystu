def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  def make_array(number)
    string_n = number.to_s.split(//)
    numbers = string_n.map do |i|
        i.to_i
    end
    return numbers
  end

  if number < 10
    true

  elsif number < 100
    two_digits = make_array(number)
    one = two_digits[0]
    two = two_digits[1]
    three = two_digits[0] * two_digits[1]
    check = [one, two, three]
    return check == check.uniq

  elsif number < 1000
  three_digits = make_array(number)
  a = three_digits[0] * three_digits[1]
  b = three_digits[1] * three_digits[2]
  c = three_digits[0] * three_digits[1] * three_digits[2]
  d = three_digits[0]
  e = three_digits[1]
  f = three_digits[2]
  check = [a, b, c, d, e, f]
  return check == check.uniq

  else
    false

  end

end





