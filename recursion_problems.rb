def range(start_num, end_num)
  if start_num == end_num
    return [start_num]
  else
    return range(start_num + 1, end_num).unshift(start_num)
  end
end

def recursive_array_sum(nums_array)
  if nums_array.length == 1
    return nums_array[0]
  else
    return nums_array[0] + recursive_array_sum(nums_array[1..-1])
  end
end

def iterative_array_sum(nums_array)
  accume = 0
  nums_array.each do |num|
    accume += num
  end

  accume
end

def first_exp(base, exponent)
  if exponent == 0
    return 1
  else
    return base * first_exp(base, exponent -1)
  end
end

def second_exp(base, exponent)
  if exponent == 0
    return 1
  elsif exponent.even?
    return second_exp(base, exponent / 2) ** 2
  else
    return base * (second_exp(base, (exponent - 1) / 2) ** 2)
  end
end

def deep_dup(array)
  if !array.is_a?(Array)
    array
  elsif !array.any?{ |elem| elem.is_a?(Array) }
    return array.dup
  else
    array.map do |element|
      deep_dup(element)
    end
  end
end

def fib_recursive(n)
  if n < 2
    return n
  else
    return fib_recursive(n-2) + fib_recursive(n-1)
  end
end

def fib_iterative(n)
  second_to_last_value = 0
  last_value = 1
  final_value = 0

  if n == 0
    return second_to_last_value
  elsif n == 1
    return last_value
  else
    (n-1).times do
      final_value = second_to_last_value + last_value
      last_value, second_to_last_value = final_value, last_value
    end
  end

  final_value
end

def fibs_up_to(n)
  fib_array = []
  (0..n).each do |num|
    fib_array << fib_recursive(num)
  end

  fib_array
end

def fibs_recursive_up_to(n)
  if n == 0
    return [0]
  elsif n == 1
    return [0,1]
  end
  array = fibs_recursive_up_to(n-1)
  array << array[-1] + array[-2]
end

def binary_search(array, target)
  len = array.length

  if array.length == 1
    array[0] == target ? 0  : nil
  else
    if target >= array[len/2]
      binary_search(array[(len/2)..-1], target) + len/2
    else
      binary_search(array[0...(len/2)], target) + 0
    end
  end
end

def making_change(amount, coins = [25, 10, 5, 1])
  if amount == 1
    return [1]
  else
    coins.each do |coin|
      if coin > amount
       next
      else
        return [coin] + making_change(amount - coin, coins)
      end
    end
  end
end

def merge_sort(array)
  len = array.length
  if len == 1
    return array
  else
    merge!(merge_sort(array[0...len/2]), merge_sort(array[len/2..-1]))
  end
end

def merge!(array1, array2)
  merged_array = []
  until array1.empty? || array2.empty?
    if array1.first >= array2.first
      merged_array << array2.shift
    else
      merged_array << array1.shift
    end
  end

  merged_array + (array1.empty? ? array2 : array1)
end

class Array
  def subsets
    if self.length == 1
     return [[], self]
   else
      small_subsets = [self]
      self.length.times do |i|
        sub_array = self.my_delete_at(i)
        small_subsets += sub_array.subsets
      end
    end
    small_subsets.uniq
  end

  def my_delete_at(index)
    array = self.dup
    array.delete_at(index)
    array
  end
end