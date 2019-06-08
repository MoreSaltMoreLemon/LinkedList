require_relative './bst_node'

class BST
  attr_accessor :root

  def initialize(*vals)
    @root = nil
  end

  def insert(val)
    if @root.nil? 
      @root = BSTNode.new(val)
    else
      @root.push_down(val)
    end
  end

  def remove(val)
    node_to_remove = self.find_node(val)

    unless node_to_remove.nil?
      parent = node_to_remove.parent
      left = node_to_remove.left
      right = node_to_remove.right

      on_left_side = parent.left == node_to_remove ? true : right

      if on_left_side
        parent.left = left
      else
        parent.right = right
      end
    end
    
    node_to_remove
  end

  def find_node(val)
    node = @root

    def dive(node, val)
      if node.nil?
        nil
      elsif node.val == val
        node
      elsif node.val > val
        dive(node.left, val)
      else
        dive(node.right, val)
      end
    end

    dive(node, val)
  end

end