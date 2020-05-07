# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not
# compute.'.

# Further Exploration
# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new
# version of compute, including a no-block call.

def compute(arg)
  return "Does not compute" unless block_given?
  yield(arg + arg)
end

# Examples:
# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(2) == "Does not compute."
p compute(2) { |arg| arg } == 4
p compute("words") { |arg| arg * 2 }  == "wordswordswordswords" # precedence is a funny thing

# lame examples, but it technically does what was asked.