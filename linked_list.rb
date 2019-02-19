require 'pry'

class LinkedList
  # include Enumerable
  # extend  Enumerable
  
  attr_reader :length
  # .new : (Any) -> LinkedList
  def initialize(*values)
    @length = values.length

    @head = nil
    @tail = nil
    values.reverse_each do |value|
      @head = Node.new(value, @head)
      @tail = @head if @tail.nil?
    end
  end

  # Returns the head Node of the LinkedList
  # #head : -> Node: instance
  def head
    @head
  end

  # Returns the head value of the LinkedList
  # #first : -> Any
  def first
    self.head.value
  end

  # Returns the tail Node of the LinkedList
  # #tail : -> Node: instance
  def tail
    @tail
  end

  # Returns the tail value of the LinkedList
  # #last : -> Any
  def last
    self.tail.value
  end

  # Adds value node to tail of LinkedList
  # #push : (Any) -> LinkedList
  def push(*values)
    head = nil
    tail = nil

    values.reverse_each do |value|
      head = Node.new(value, head)
      tail = head if tail.nil?
    end

    @tail.next = head
    @tail = tail
    @length += values.length
    self
  end

  # Removes value node from tail of Linked List
  # Returns value of old tail Node
  # #pop_last : -> Any
  def pop_last
    if @head == @tail
      last_node = @tail
      @head = nil
      @tail = nil
      @length -= 1

      last_node.value
    else
      node = @head
      until node.next == @tail
        node = node.next
      end
      last_node = @tail
      @tail = node
      @tail.next = nil
      @length -= 1

      last_node.value
    end
  end

  # Returns the last value of the LinkedList, or
  # if given an integer value, the last
  # #pop : -> Any
  # #pop : (Integer) -> [Any]
  def pop(n = 1)
    raise TypeError unless n.instance_of?(Fixnum)

    if n == 1
      self.pop_last
    elsif n > 1
      n = n > self.length ? self.length : n

      popped = []
      (1..n).each {|v| popped << self.pop_last }
      popped.reverse
    else
      raise RangeError
    end
  end

  
  # Adds value node to head of LinkedList
  # #unshift : (Any) -> LinkedList
  # def unshift(value)
  # end


  # Removes value node from head of Linked List
  # #shift : -> Any
  # def shift
  # end

  # def insert
  # end

  # def insert_before
  # end

  # def insert_before(node)
  # end

  # def insert_after(node)
  # end

  # Removes current node from LinkedList
  # def delete
  # end

  # Removes specified node from LinkedList
  # def delete(node)
  # end

  # Provides #each method for use by Enumerable methods
  # allowing for traversal, sorting, and searching
  # Returns self, unmodified
  # #each : -> LinkedList: instance
  def each(&block)
    node = @head
    until node.nil?
      block.(node.value)
      node = node.next
    end
    self  # for chaining
  end

  # Provides <=> comparator operator for use by Enumerable
  # methods #max, #min, and #sort
  # def <=>
  # end

  

  # converts LinkedList to Array
  # #to_a : -> Array: instance
  # def to_a
  # end

  # Implements #to_s method so that it can be printed
  # def to_s
  # end
end
