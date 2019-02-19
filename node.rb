class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end

  def insert(value)
    next_node = self.next
    self.next = Node.new(value, next_node)
    self
  end
end