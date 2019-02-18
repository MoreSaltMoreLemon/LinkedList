require 'pry'

class LinkedList
  # include Enumerable
  # extend  Enumerable
  
  attr_reader :length
  # .new : (Any) -> LinkedList
  def initialize(*values)
    @length = values.length
    @head = nil

    values.reverse_each do |value|
      @head = Node.new(value, @head)
    end

    @current = @head
  end

  # Adds value node to tail of LinkedList
  # #push : (Any) -> LinkedList
  # def push(value)
  # end

  # Adds value node to head of LinkedList
  # #unshift : (Any) -> LinkedList
  # def unshift(value)
  # end

  # Removes value node from tail of Linked List
  # #pop : -> Any
  # def pop
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
  # #each
  # def each
  # end

  # Provides <=> comparator operator for use by Enumerable
  # methods #max, #min, and #sort
  # def <=>
  # end

  # Returns the head value of the LinkedList
  # #head : -> Node: instance
  # def head
  # end

  # alias_method :first, :head

  # converts LinkedList to Array
  # #to_a : -> Array: instance
  # def to_a
  # end

  # Implements #to_s method so that it can be printed
  # def to_s
  # end
end
