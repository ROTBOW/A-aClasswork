class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove #wreckt self
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new(:head, true)
    @tail = Node.new(:tail, true)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each { |node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    self.each { |node| return true if node.key == key}
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev
    new_node.next = @tail
    new_node.prev.next = new_node
    @tail.prev = new_node    
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key==key
      break if node.key==key
    end
  end

  def remove(key)
    self.each do |node|
      node.remove if node.key == key
      break if node.key == key
    end
  end

  def each(&prc)
    working_node = self.first
    until working_node == @tail
      prc.call(working_node)
      working_node = working_node.next
    end
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
