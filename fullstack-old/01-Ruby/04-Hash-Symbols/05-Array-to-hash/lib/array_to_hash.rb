# def array_to_hash(array)
#    p block_given?
#    block_given? ? blocks(array, block) : no_block(array)

# end

# def no_block(array)
#   hashy = {}
#   array.each_with_index do |element, i|
#     hashy[i.to_s] = element
#   end
#   return hashy
# end

# def blocks(array, &block)
#   block.call
#   hashy = {}
#   array.each_with_index do |element, i|
#     hashy[yield(i)] = element
#   end

# end

# p array_to_hash( ["a", "b", "c"] ) { |index| "key#{index}" }


def array_to_hash(array)
  hashy = {}
  array.each_with_index do |element, i|
    if block_given?
      hashy[yield(i)] = element
    else
      hashy[i.to_s] = element
    end
  end
  return hashy
end


# p array_to_hash( ["a", "b", "c"] ) { |index| "key#{index}" }

