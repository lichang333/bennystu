

class SlotMachine
  def initialize
    @wheel = {Joker: 50, Star: 40, Bell: 30, Seven: 20, Cherry: 10}
    # @result_keys: [Hash[@wheel.to_a.sample, Hash[@wheel.to_a.sample, Hash[@wheel.to_a.sample
    # @result = [@result_keys[1], @result_keys[1] ]
    # @result = [@wheel.to_a.sample[1], @wheel.to_a.sample[1], @wheel.to_a.sample[1]]

    # while score != 50
    #    p @result
    #    @result = [@wheel.to_a.sample[1], @wheel.to_a.sample[1], @wheel.to_a.sample[1]]
    # end
  end

  def score(reel)
    @result = [@wheel[reel[0].to_sym], @wheel[reel[1].to_sym], @wheel[reel[2].to_sym]]
    p @result
    if @result[0] == @result[1] && @result[1] == @result[2]
      @result[0]
    elsif @result.include? 50
      two_jokers = @result.select { |item| item == 50 }
      if two_jokers.size > 1
      25
      else
      @result.delete(50)
      @result[0] == @result[1] ?  @result[0] / 2   : "you lost"
      end
    else
      "you lost"
    end
  end
end
a = SlotMachine.new
p a.score(["Joker", "Cherry", "Cherry"])

# @result.reduce( :+ )
