
def sluggish_octopus(arr)
    
    sorted = false
    while sorted
        sorted = true
        i = 0 
        if arr[i] > arr[i + 1]
            arr[i], arr[i + 1] = arr[i + 1], arr[i]
            sorted = false
        end
        i += 1
    end
    arr[-1]
end

def dominant_octopus(arr)
    return arr if arr.length < 2
    pivot = arr.first 
    left = arr[1..-1].select { |ele| ele.length < pivot.length }
    right = arr[1..-1].select { |ele| ele.length >= pivot.length }
    dominant_octopus(right)
end

def clever_octopus(arr)
    arr.max { |a, b| a.length <=> b.length }
end

def slow_dance(direction, tiles_array)
    tiles_array.index(direction)
end

def fast_dance(direction, new_tiles_data_structure)
    new_tiles_data_structure[direction]
end



arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }

p sluggish_octopus(arr)
p dominant_octopus(arr)
p clever_octopus(arr)
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
