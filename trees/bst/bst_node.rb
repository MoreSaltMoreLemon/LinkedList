class BSTNode
  attr_accessor :parent, :left, :right, :val

  def initialize(val=nil)
    @val = val
  end

  def push_down(val)
    if (self.val > val)
      if self.left.nil?
        self.left = BSTNode.new(val) 
      else
        self.left.push_down(val)
      end
    else
      if self.right.nil?
        self.right = BSTNode.new(val)
      else
        self.right.push_down(val)
      end
    end
  end
end