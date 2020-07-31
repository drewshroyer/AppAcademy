

def first_anagram?(str1, str2)   # time complexity == O(n!) 
    arr = str1.split("").permutation.to_a
    arr.include?(str2.split(""))
end

def second_anagram?(str1, str2)  # time comp == n^2 + m  or O(n * m^2)
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.each_with_index do |ele, idx|
        if arr2.include?(ele)
            arr2[arr2.find_index(ele)] = "" 
        end
    end
    arr2.join.empty?
end

def third_anagram?(str1, str2)  #O(n log(n)) or O(n + m)
    str1.split("").sort == str2.split("").sort
end

def fourth_anagram?(str1, str2) # time comp = O(n + m)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}
    hash1 == hash2
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("gizmo", "sally")    #=> false
