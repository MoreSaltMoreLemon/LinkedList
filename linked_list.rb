require 'pry'
require_relative 'node'

class LinkedList
  include Enumerable
  extend  Enumerable
  
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
  # #push : (Any[]) -> LinkedList
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
  def pop
    if @head == @tail
      last_node = @tail
      @head = nil
      @tail = nil
      @length = 0

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

  
  # Adds value node to head of LinkedList
  # #unshift : (Any) -> LinkedList
  def unshift(*values)
    head = nil
    tail = nil

    values.reverse_each do |value|
      head = Node.new(value, head)
      tail = head if tail.nil?
    end

    tail.next = @head
    @head = head
    @length += values.length
    self
  end

  # Removes value node from head of Linked List
  # Returns value of old head Node
  # #shift_first : -> Any
  def shift_first
    if @head == @tail
      last_node = @tail
      @head = nil
      @tail = nil
      @length -= 1

      last_node.value
    else
      node = @head
      @head = node.next
      @length -= 1

      node.value
    end
  end

  # Removes value node(s) from head of Linked List
  # Returns the first value of the LinkedList, or
  # if given an integer value, the first n values
  # #shift : -> Any
  # #unshift : (Integer) -> [Any]
  def shift(n = 1)
    raise TypeError unless n.instance_of?(Fixnum)

    if n == 1
      self.shift_first
    elsif n > 1
      n = n > self.length ? self.length : n

      shifted = []
      (1..n).each {|v| shifted << self.shift_first }
      shifted
    else
      raise RangeError
    end
  end

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

  # converts LinkedList to Array
  # #to_a : -> Array: instance
  def to_a
    self.map do |node|
      node
    end
  end

  # Implements #to_s method so that it can be printed
  def to_s
    if @head.nil?
      return "[]"
    else
      node = @head
      str = "[#{node.value}"
      until node.nil?
        str += " > #{node.value}"
        node = node.next
      end
      str += "]"
    end
  end
end


# binding.pry
0