class Node
  attr_reader :data, :next

  def initialize(data)
    @data = data.nil? ? raise(ArgumentError, 'Data cannot be nil') : data
    @next = nil
  end

  def data=(new_data)
    @data = new_data.nil? ? raise(ArgumentError, 'Data cannot be nil') : new_data
  end

  def next=(new_next)
    @next = new_next.is_a?(Node) || new_next.nil? ? new_next : raise(ArgumentError, 'next must be a Node or nil')
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
    slow_pointer = @head
    fast_pointer = @head
    current_node = @head.next
    until fast_pointer.nil? || fast_pointer.next.nil?
      2.times do
        break if current_node.nil?
        arr << current_node.data.to_s
        current_node = current_node.next
      end
      slow_pointer = slow_pointer.next
      fast_pointer = fast_pointer.next.next
    end
    arr << 'nil'
    arr.delete(slow_pointer.data.to_s)
    p arr.join(' -> ')
    arr
  end

  def delete_middle_node_second
    return nil if @head.nil? || @head.next.nil?
    arr = ["#{@head.data} (head)"]
    counter = 0
    middle = @head
    current_node = @head.next
    until @head.nil?
      unless current_node.nil?
        arr << current_node.data.to_s
        current_node = current_node.next
      end
      middle = middle.next if counter.odd?
      counter += 1
      @head = @head.next
    end
    arr << 'nil'
    arr.delete(middle.data.to_s)
    p arr.join(' -> ')
    arr
  end
end