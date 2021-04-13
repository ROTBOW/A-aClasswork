# Phase 1
def my_min(arr) # O(n^2)
    ans = Float::INFINITY
    arr.each do |ele1|
        curr_comparison = 1/0.0
        arr.each do |ele2|
            curr_comparison = (ele1 < ele2) ? ele1 : ele2
        end
        ans = (curr_comparison < ans) ? curr_comparison : ans
    end
    ans
end

# Phase 2
def my_min2(arr) # O(n)
    ans = arr.first
    arr.each do |ele|
        ans = (ele < ans) ? ele : ans
    end
    ans
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_min2(list)  # =>  -5




def largest_contiguous_subsum(arr) # O(n^2)
    sub_arr = []
    arr.each_with_index do |ele1, idx1|
        sub_arr << [ele1]
        arr.each_with_index do |ele2, idx2|
            if idx1 < idx2
                sub_arr << arr[idx1..idx2]
            end
        end
    end
    sub_arr.map(&:sum).max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list)

# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2)




def better_largest_contiguous_subsum(arr) # O(n)
    current_sum = arr.first
    largest_sum = arr.first
    
    arr[1..-1].each do |num|
        current_sum += num
        current_sum = num if current_sum < num 
        largest_sum = current_sum if current_sum > largest_sum

    end
    largest_sum
end

list = [5, 3, -7] # [[5], [5, 3], [3], [5, 3, -7], [3, -7], [-7]]
p better_largest_contiguous_subsum(list)
list2 = [2, 3, -6, 7, -6, 7]
p better_largest_contiguous_subsum(list2)
list3 = [-5, -1, -3]
p better_largest_contiguous_subsum(list3) # => -1 (from [-1])