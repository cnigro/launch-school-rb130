# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

# Further Exploration
# Can you find other ways to solve this problem? What methods might prove
# useful? Can you find a way to solve this without using a method that requires
# a block?

# Using a block
def missing(arr)
  found = Array.new
  arr[0].upto(arr[-1]) do |num|
    found << num unless arr.include?(num)
  end
  found
end

# Not using a block
def missing(arr)
  found = (array[0]..arr[-1]).to_a
  found - arr
end

# Examples:
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []