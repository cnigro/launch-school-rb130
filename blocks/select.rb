def select(array)
  counter = 0
  selection = []

  while counter < array.size
    selection << array[counter] if yield(array[counter])
    counter += 1
  end

  selection
end

p select([1, 2, 3, 4, 5]) { |num| num.even? }
p select([1, 2, 3, 4, 5]) { |num| num.odd? }