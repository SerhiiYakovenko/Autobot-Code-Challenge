require 'pp'

class ArrayList
  def initialize(list = nil, target = nil)
    @list = list
    @target = target
  end

  def find_array_by_target(target = @target)
    return nil if @list.nil?
    @list.each { |array| pp array if array.include? target }
  end
end