require 'pry'

class SkipListNode
  attr_reader :value

  def initialize(value)
    @value = value
    @next = []
  end

  def next
    @next[0].nil? ? nil : @next[0]
  end

  def next=(node)
    if node.class == self.class
      @next[0] = node
    else
      raise TypeError.new 'incorrect argument type'
    end
  end

  def lane_next(level, node=nil)
    if  level.is_a? Integer
      if node.nil? 
        if level >= 0 && level < @next.length
          @next[level]
        else
          raise ArgumentError.new 'level parameter out of bounds'
        end
      elsif node.class == self.class
        # binding.pry
        if level >= 0 && level <= @next.length
          @next[level] = node 
        else
          raise ArgumentError.new 'level parameter out of bounds'
        end
      else
        raise TypeError.new 'incorrect argument type, expected SkipListNode'
      end
    else
      raise TypeError.new 'incorrect argument type, expected integer value for level'
    end
  end

end