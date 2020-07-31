require 'byebug'

def phase_I_my_min(arr) #time comp = O(n^2)
    min = arr.first
    arr.each do |ele1|
        arr.each do |ele2|
            min = ele1 if ele1 <= min
        end
    end
    min
end

def phase_II_my_min(arr) #time comp = O(n)
    min = arr.first
    arr.each do |ele1|
        min = ele1 if ele1 <= min
    end
    min

end


# arr = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p phase_I_my_min(arr)
# p phase_II_my_min(arr)

def ph_I_largest_contiguous_subsum(list) # time comp O(n^2)
    arr = []
    i = 0
    ans = []
    while i < list.length
        x = 0
        while x < list.length

            temp_arr = []
            temp_arr << list[i..x] 
            arr << temp_arr.flatten unless temp_arr.empty? # why is this still giving empty arr?
            x += 1
        end
        i += 1
    end
    result = []
    ans = arr.reject {|ele| ele == []}
    ans.each {|sub| result << sub.sum}
    result.sort.last
end

def ph_2_largest_contiguous_subsum(list)
    temp_sum, max_sum = list.first, list.first
    i = 1
    while i < list.length
        temp_sum = 0 if temp_sum < 0
        temp_sum += list[i] 
        max_sum = temp_sum  if temp_sum > max_sum
        i += 1
    end
    max_sum
end

    list1 = [2, 3, -6, 7, -6, 7] # = > 8
    list2 = [-5, -1, -3] # = > -1
    list3 = [5, 3, -7] # => 8
    p ph_2_largest_contiguous_subsum(list1)
    p ph_2_largest_contiguous_subsum(list2)
    p ph_2_largest_contiguous_subsum(list3)

    # current_sum = list.first
    # largest_sum = list.first
    # list.inject do |acc, el|
    #     acc + el unless el < acc
    # end

    # holder = []
     # # holder = []
    # return list.flatten if list.length < 2
    
    # left = ph_2_largest_contiguous_subsum(list[1..-1])
    # right = ph_2_largest_contiguous_subsum(list[0..-2])

    # [left.flatten] + [right.flatten]
    
    def ph_2_largest_contiguous_subsumX(list)
        temp_sum = list.first
        max_sum = list.first
        i = 0
        while i < list.length=
            temp_sum += arr[i]
            max_sum = temp_sum if temp_sum > largest
            i += 1
        end
        max_sum
    end