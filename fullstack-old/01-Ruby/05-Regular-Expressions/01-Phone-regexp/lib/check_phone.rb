require "pry"

def french_phone_number?(phone_number)
  phone_number = phone_number.gsub(/[^0-9]/, '')
  phone_number =~ /((^0[^0].{8})|^(33.{9}))/ ? true : false
end



