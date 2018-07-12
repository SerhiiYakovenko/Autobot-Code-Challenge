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

puts 'Creating new LinkedList with n Nodes, is our case is 12 and delete middle one'
list1 = LinkedList.new(1)
(2..12).each { |x| list1.append(x) }
list1.delete_middle_node
puts "New LinkedList is #{list1.inspect}"

puts '====================================='

puts 'As bonus, second variant of getting middle node position with 1 itteration'
puts 'Creating new LinkedList with n Nodes, is our case is 12 and get middle one'
list2 = LinkedList.new(1)
(2..12).each { |x| list2.append(x) }
puts "So the middle node is #{list2.find_middle_node}"