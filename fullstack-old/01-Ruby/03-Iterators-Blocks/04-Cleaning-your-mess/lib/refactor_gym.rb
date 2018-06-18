
def hop_hop_hop(number_of_exercises)
  (1..number_of_exercises).to_a.each do |i|
    print "hop! " * i
    print "One more time..." + "\n"
  end
end

hop_hop_hop(6)
