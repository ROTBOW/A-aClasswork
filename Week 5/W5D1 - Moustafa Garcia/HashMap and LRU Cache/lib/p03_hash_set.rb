class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    resize! if @count >= @num_buckets
    unless self[key.hash].include?(key)
      self[key.hash] << key 
      @count += 1
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets *= 2
    temp_new = Array.new(@num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each { |ele| temp_new[ele.hash % @num_buckets] << ele }
    end
    @store = temp_new
  end
end
