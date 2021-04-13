class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    answer = ""
    self.each_with_index do |ele, idx|
      ele = ele.to_i if ele.is_a?(String)
      answer += (ele*5).to_s if idx.even?
      answer += (idx**2).to_s if ele.even?
      answer += (ele**2).to_s if idx.odd?
      answer += (idx*5).to_s if ele.odd?
    end
     answer.to_i
  end
 
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = self.keys.map(&:to_s) + self.values.map(&:to_s)
    arr.hash
  end
end
