def bubble_sort(&prc)
    prc ||= Proc.new { |a,b| a <=> b }
    array = self.dup; sorted = false
    while !sorted
      sorted = true
      (0...length - 1).each do |i|
        if prc.call(array[i], array[i + 1]) == 1
          array[i], array[i + 1] = array[i + 1], array[i] 
          sorted = false
        end
      end
    end
    array
  end

  class Array
    # Write an `Array#merge_sort` method; it should not modify the original array.
    # **Do NOT use `Array#sort` or `Array#sort_by` in your implementation.**
  
    def merge_sort(&prc)
      return self if self.length < 2
  
      middle = self.length / 2
      left = self.take(middle)
      right = self.drop(middle)
  
      left_sorted = left.merge_sort(&prc)
      right_sort = right.merge_sort(&prc)
  
      Array.merge(left_sorted, right_sort, prc)
    end
  
    private
    def self.merge(left, right, prc)
      prc ||= Proc.new { |a, b| a <=> b }
  
      merged_array = []
      until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1
          merged_array << left.shift
        else
          merged_array << right.shift
        end
      end
      merged_array + left + right
    end
  
  end

  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.take(mid).my_bsearch(target)
    else
      search_res = self.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end
end


class Array
    # Define a method `Array#quick_sort` that implements the quick sort method. 
    # The method should be able to accept a block. Do NOT use the built-in
    # `Array#sort` or `Array#sort_by` methods in your implementation.
  
    def my_quick_sort(&prc)
      prc ||= proc {|a, b| a<=>b}
      return self if size < 2
  
      pivot = first
      left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
      right = self[1..-1].select{|el| prc.call(el, pivot) != -1}
      left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
    end  
  end
