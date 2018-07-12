# Question 1
# ----------
# Write a method that answers the following problem:
#
# Accept as input:
# * list: a singly-linked list
#
# Remove the middle element of the list without iterating the list more than once.
# Assume the list size is not known until traversed.

require_relative '../codebase/question_1'

list1 = LinkedList.new(1)
(2..12).each { |x| list1.append(x) }
list1.delete_middle_node
list1.inspect

list2 = LinkedList.new(1)
(2..12).each { |x| list2.append(x) }
p list2.find_middle_node