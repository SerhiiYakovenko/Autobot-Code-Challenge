# Question 2
# ----------
#
# Write a method that answers the following problem:
#
#                                               Accept as input:
#
# * list: an unordered list of arrays each with 4 elements.
#     * target: an integer
#
# Find and display the complete array that contains the provided target number.
#
#     Support your answers with a suite of unit tests.

require_relative '../codebase/question_2'

random_array = Array.new(rand(3..5)) { Array.new(4) { rand(1...9) } }
random_target = rand(1..9)
p "Array is #{random_array} and target is #{random_target}"

list = ArrayList.new(random_array)
list.find_array_by_target(random_target)

list = ArrayList.new(random_array, random_target)
list.find_array_by_target