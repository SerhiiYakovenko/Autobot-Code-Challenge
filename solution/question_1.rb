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

node_1 = Node.new 1
node_2 = Node.new 2
node_3 = Node.new 3
node_4 = Node.new 4
node_5 = Node.new 5
node_6 = Node.new 6

node_1.next = node_2
node_2.next = node_3
node_3.next = node_4
node_4.next = node_5
node_5.next = node_6

list = LinkedList.new node_1
list.delete_middle_node
list.delete_middle_node_second