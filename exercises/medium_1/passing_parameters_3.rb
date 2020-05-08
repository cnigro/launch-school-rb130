# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:

gather(items) do | *produce, grain |
  puts produce.join(", ") # let's ignore that corn is a grain
  puts grain
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do | fruit, *vegetables, grain |
  puts fruit
  puts vegetables.join(", ") # corn is a grain, but ok
  puts grain
end
# # Let's start gathering food.
# # apples
# # corn, cabbage
# # wheat
# # We've finished gathering!

gather(items) do | fruit, *not_fruit |
  puts fruit
  puts not_fruit.join(", ")
end
# # Let's start gathering food.
# # apples
# # corn, cabbage, wheat
# # We've finished gathering!

gather(items) do | apples, corn, cabbage, wheat |
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!