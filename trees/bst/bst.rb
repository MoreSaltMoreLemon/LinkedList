require_relative './bst_node'

class BST
  attr_accessor :root

  def initialize(*vals)
    @root = nil
  end

  def insert(val)
    node = BSTNode.new(val)

    if @root.nil? 
      @root = node
    else
      @root.push_down(node)
    end
  end

  def remove(val)
  end
  
end