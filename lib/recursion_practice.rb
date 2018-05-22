def range_iterative(start_idx, end_idx)
  range = []

  i = start_idx

  while i < end_idx
    range << i
    i += 1
  end

  range
end

def range_recursive(start_idx, end_idx)
  return [] if end_idx <= start_idx
  range_recursive(start_idx, end_idx - 1) << end_idx - 1
end

def exponentiation_one(base, power)
  return 1 if power == 0
  base * exponentiation_one(base, power - 1)
end

def exponentiation_two(base, power)
  return 1 if power == 0

  sqrt = exponentiation_two(base, power / 2)

  if power.even?
    sqrt * sqrt
  else
    base * sqrt * sqrt
  end
end

class Array

  def deep_dup
    new_arr = []

    self.each do |el|
      if el.class == Array
        new_arr << el.deep_dup
      else
        new_arr << el
      end
    end

    new_arr
  end

end

def fibonacci(num)
  return [] if n == 0
  return [1] if n ==1

  fib_seq = [1, 1]

  while fib_seq.length < num
    fib_seq << fib_seq[-2] + fib_seq[-1]
  end

  fib_seq
end

def fibonacci_recursive(num)
  return [1,1].take(num) if num <= 2

  fib_seq = fibonacci_recursive(num - 1)
  fib_seq << fib_seq[-2] + fib_seq[-1]
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2

  left = merge_sort(arr.take(mid))
  right = merge_sort(arr.drop(mid))

  merge(left, right)
end

def merge(left, right)
  merged = []

  until left.empty?
   if (left.first < right.first)
     merged << left.shift
   else
     merged << right.shift
   end
  end

  merged + right
end

def binary_search(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2
  p arr, arr.take(mid), arr.drop(mid)

  if target == arr[mid]
    mid
  elsif target < arr[mid]
    binary_search(arr.take(mid), target)
  else
    return mid + 1 + binary_search(arr.drop(mid + 1), target)
  end
end

def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr.take(arr.length - 1))
  subs.concat(subs.map { |el| el + [arr[-1]] })
end

def permutations(array)

end
