

#O(n) linear time
#O(n) linear space
def two_sum?(arr, target_sum)
    hash = {}
    arr.each do |el|
      return true if hash[target_sum - el]
      hash[el] = true
    end
    false
  end


arr = [0, 1, 5, 7]

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
