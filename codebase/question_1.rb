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

  def inspect
    return nil if @head.nil?
    arr = ["#{@head.data} (head)"]
    current_node = @head.next
    until current_node.nil? do
      arr << "#{current_node.data}"
      current_node = current_node.next
    end
    arr << "nil"
    arr.join(' -> ')
  end

  def append node_or_data
    new_node = node_or_data.instance_of?(Node) ? node_or_data : Node.new(node_or_data)
    current_node = @head
    if current_node.nil?
      @head = new_node
      return
    end
    current_node = current_node.next until current_node.next.nil?
    current_node.next = new_node
  end

  def delete_middle_node
    return nil if @head.nil? || @head.next.nil?
    previous = @head
    slow_pointer = @head
    fast_pointer = @head
    until fast_pointer.nil? || fast_pointer.next.nil?
      fast_pointer = fast_pointer.next.next
      previous = slow_pointer
      slow_pointer = slow_pointer.next
    end
    previous.next = slow_pointer.next
  end

  # Another variant for finding middle node
  def find_middle_node
    return nil if @head.nil? || @head.next.nil?
    counter = 0
    middle = @head
    until @head.nil?
      middle = middle.next if counter.odd?
      counter += 1
      @head = @head.next
    end
    middle.data
  end
end