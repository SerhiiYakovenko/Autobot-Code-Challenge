class ArrayList
  def initialize(list, target = nil)
    @list = list.is_a?(Array) && !list.empty? ? list : raise(ArgumentError, 'Only array with data accepted.')
    @target = target
  end

  def find_array_by_target(target = @target)
    return nil if target.nil?
    @list.each do |array|
      array.respond_to?(:each) ?
          (p(array) if array.include?(target)) :
          raise(ArgumentError, 'list must contains of arrays each with 4 elements.')
    end
  end
end