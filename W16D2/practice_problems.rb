
# Write a method that takes a string as input. 
# It should return true if the input is a valid IPv4 address 
# (ie. anything between 0.0.0.0 and 255.255.255.255 is valid).


#pseudocode:
#will always take: integers-period-integers-period-integers-period-integers
#split it on the periods
#iterate through each integer section, check if each integer is between 0 and 255 inclusive


def valid_ip?(string)
    chars = string.split("")
    good_chars = ["1","2","3","4","5","6","7","8","9","0","."] 
    chars.any? {|char| !good_chars.includes(char.to_i) } 

    integers_array = string.split(".")

    integers_array.all? do |integer| 
        integer.to_i >= 0 && integer.to_i <= 255
    end
        
    return false if integers_array.length != 4
end


# Write a method that reads in a file of integers, one per line, and sums them. Skip the line if it begins with a "#".

# i would create a variable that represented the File using rubys File class, 
# assuming one integer per line. 
# iterate through each line of the File and map it using readlines into an array, checking if there is a # at the beginng, skipping those lines 
#i would take the array that i made and sum it 

def sum_from_file(filename)
    nums = File.readlines(filename)
    sum = 0
    nums.each do |number|
        if (number.to_s)[0] == "#"
            sum += 0
        else 
            sum += number
        end
    end 
    return sum
end