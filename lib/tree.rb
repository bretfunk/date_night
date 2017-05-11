require_relative 'node'

class BinarySearchTree
  attr_accessor :head

  def initialize(head=nil)
    @head = head
  end

  def insert(review, title)
    if head == nil
      @head = Node.new(review, title)
    else
      head.insert(review, title)
    end
  end

  def include?(number)
      @head.include?(number)
  end

  def depth_of(number)
    @head.depth_of(number)
  end

  def max
    @head.max
  end

  def min
    @head.min
  end
end
