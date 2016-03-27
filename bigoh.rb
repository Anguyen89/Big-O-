require 'byebug'

def my_min(arr)
  min = arr[0]
  arr.each_index do |idx|
    arr[idx + 1..-1].each do |num2|
      min = num2 if num2 < min
    end
  end
  min
end



def my_min(array)
  min = array[0]
  array.each do |num|
    min = num if num < min
  end
  min
end

# p my_min([0,3,5,4,-5,10,1,90])

def large_sum2(list)
  debugger
  max = 0
  curr_sum = 0
  list.each_with_index do |value, idx|
    if curr_sum > 0
      curr_sum += value
    else
      curr_sum = value
    end
    max = curr_sum if curr_sum > max
  end
  max
end


def large_sum(list)
  max = 0
  list.each_index do |idx|
    list[0..-1].each_index do |idx2|
      next if list[idx..idx2].empty?
      sum = list[idx..idx2].inject(:+)
       if sum > max
         max = sum
       end
    end
  end
  max
end



def first_anagrams(str,str1)

  str.chars.permutation.to_a.include?(str1.chars)

# complexity of O(n^2)
end

def second_anagram?(str, other_str)
  first_str = str.chars
  second_str = other_str.chars

  until first_str.empty? || second_str.empty?
    curr_let = first_str.first
    if second_str.include?(curr_let)
      curr_idx = second_str.find_index(curr_let)
      second_str.delete_at(curr_idx)
      first_str.shift
    end
  end

  (first_str.empty? && second_str.empty?) ? true : false


end

def third_anagram?(str, other_str)
  return true if str.chars.sort == other_str.chars.sort
  false
end

def fourth_anagrams?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.chars.each do |letter|
    hash1[letter] += 1
  end
  str2.chars.each do |letter|
    hash2[letter] += 1
  end

  hash1 == hash2
end

def albert_anagrams(str1, str2)
  hash1 = Hash.new(0)

  str1.chars.concat(str2.chars).each do |letter|
    hash1[letter] += 1
  end

  hash1.values.all? {|freq| freq % 2 == 0}

end

def brute_force_two_sum_bad(arr,target)
  arr.permutation(2).each do |pair|
    return true if pair.first + pair.last == target
  end
  false
  #probably O(n^2) (depends on permutation)
end

def ok_two_sum(arr, target)
  arr.sort.each do |el|
    rem = target - el
    return true if bsearch(arr - [el], rem)
  end
  false
end


def bsearch(arr, target)
  mid = arr.count / 2
  return arr[mid] if arr[mid] == target
  return false if arr.size < 2
  left = arr[0...mid]
  right = arr[mid..-1]
  if target < arr[mid]
    bsearch(left, target)
  elsif target > arr[mid]
    bsearch(right, target)
  end
end

def good_pair_sum(arr, target)
  hash_map = Hash.new
  arr.each do |el|
    hash_map[el] = target - el
  end
  arr.any?{ |el| hash_map.keys.include?(target - el) }
end

def max_windowed_range(array, window_size)
  current_max_range = 0
  array.each_index do |idx|
    # byebug
    unless (window_size + idx) > array.length
      range = array[window_size + idx - 1] - array[idx]
      current_max_range = range if range > current_max_range
    end
  end
  current_max_range
end
