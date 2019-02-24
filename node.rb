class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end

  def insert(value)
    self.next = Node.new(value, self.next)
  end

end