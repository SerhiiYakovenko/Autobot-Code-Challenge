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

list = ArrayList.new([[1, 2, 5, 4], [5, 6, 7, 8], [1, 5, 9, 10]])
list.find_array_by_target(1)

list = ArrayList.new([[3, 8, 5, 2], [12, 3, 5, 11], [10, 8, 1, 6]], 3)
list.find_array_by_target