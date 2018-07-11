# Question 1
# ----------
#
# Write a method that answers the following problem:
#
# Accept as input:
# * list: a singly-linked list
#
# Remove the middle element of the list without iterating the list more than once.
#     Assume the list size is not known until traversed.


class Node
  attr_reader :data, :next

  def initialize(data)
    @data = data.nil? ? raise('Data cannot be nil') : data
    @next = nil
  end

  def data=(new_data)
    @data = new_data.nil? ? raise('Data cannot be nil') : new_data
  end

  def next=(new_next)
    @next = new_next.is_a?(Node) || new_next.nil? ? new_next : raise('next must be a Node or nil')
  end
end

class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = if head.instance_of? Node
              head
            elsif head.nil?
              nil
            else
              Node.new(head)
            end
  end

  def head=(new_head)
    @head = if new_head.instance_of?(Node)
              new_head
            elsif new_head.nil?
              nil
            else
              raise 'head must be a Node or nil'
            end
  end

  def delete_middle_node
    return nil if @head.nil? || @head.next.nil?
    arr = ["#{@head.data} (head)"]
    previous = nil
    slow_pointer = @head
    fast_pointer = @head
    current_node = @head.next
    until fast_pointer.nil? || fast_pointer.next.nil?
      2.times do
        break if current_node.nil?
        arr << current_node.data.to_s
        current_node = current_node.next
      end
      previous = slow_pointer
      slow_pointer = slow_pointer.next
      fast_pointer = fast_pointer.next.next
    end
    arr << 'nil'
    arr.delete(slow_pointer.data.to_s)
    p arr.join(' -> ')
  end

  def delete_middle_node_second
    return nil if @head.nil? || @head.next.nil?
    arr = ["#{@head.data} (head)"]
    counter = 0
    previous = nil
    middle = @head
    current_node = @head.next
    until @head.nil?
      2.times do
        break if current_node.nil?
        arr << current_node.data.to_s
        current_node = current_node.next
      end
      previous = middle
      middle = middle.next if counter.odd?
      counter += 1
      @head = @head.next
    end
    arr << 'nil'
    arr.delete(middle.data.to_s)
    p arr.join(' -> ')
  end
end

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
