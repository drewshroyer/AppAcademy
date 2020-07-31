

def first_anagram?(str1, str2)   # time complexity == O(n!) 
    arr = str1.split("").permutation.to_a
    arr.include?(str2.split(""))
end

def second_anagram?(str1, str2)  # time comp == n^2  && space comp == n
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.each_with_index do |ele, idx|
        if arr2.include?(ele)
            arr2[arr2.find_index(ele)] = "" 
        end
    end
    arr2.join.empty?
end

def third_anagram?(str1, str2)  #O(n log(n)) space comp O(n) 
    str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2) # time comp = O(n), space comp == O(1)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}
    hash1 == hash2
end

def other_anagram?(str1, str2)
    return false if str1.length != str2.length
    hash = Hash.new(0)
    str1.each_char {|char| hash[char] += 1}
    str2.each_char {|char| hash[char] += 1}
    hash.values.all?(&:even?)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true
# p fourth_anagram?("elvis", "lives")    #=> true
# p fourth_anagram?("gizmo", "sally")    #=> false
p other_anagram?("elvis", "lives")    #=> true
p other_anagram?("gizmo", "sally")    #=> false
p other_anagram?("elvis", "liveasdfasdfaaasa")    #=> false
p other_anagram?("gizmo", "sallyasdfasdf")    #=> false