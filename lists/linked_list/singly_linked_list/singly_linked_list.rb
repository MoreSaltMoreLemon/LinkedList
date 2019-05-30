require 'pry'
require_relative 'node'

class SinglyLinkedList
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

    # if the SLL is empty
    @head = head if @head.nil?
    if @tail.nil?
      @tail = head
    else 
      @tail.next = head
    end

    @tail = tail
    @length += values.length
    self
  end

  # Adds << alias for #push method
  alias_method :<<, :push

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

  # Implements #map method for Singly Linked List
  # while preserving the original SLL
  # Returns transformed SLL
  # #map : -> LinkedList: instance
  def map(&block)
    mapped = SinglyLinkedList.new()
    node = @head
    until node.nil?
      mapped << block.(node.value)
      node = node.next
    end
    mapped  # for chaining
  end

  # converts LinkedList to Array
  # #to_a : -> Array: instance
  def to_a
    arr = []
    self.each {|v| arr << v }
    arr
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

0