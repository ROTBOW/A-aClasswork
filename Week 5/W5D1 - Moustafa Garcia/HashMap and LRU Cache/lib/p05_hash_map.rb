require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @num_buckets = num_buckets
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
    temp = @store[bucket(key)] #key, val)
    if temp.empty?
      temp.append(key,val)
    else
      temp.update(key, val)
    end
      nil
  end

  def get(key)
    # key.hash % @num_buckets
    @store[bucket(key)]
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % num_buckets
  end
end
