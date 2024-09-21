module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |elem|
      return false if !yield(elem) 
    end
    true
  end
  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end
  def my_count
    return self.length unless block_given?
    count = 0
    self.my_each do |elem|
      count += 1 if yield(elem)
    end
    count
  end
  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end
  def my_inject init=0
    self.my_each do |elem| 
      init = yield(elem, init)
    end
    init
  end
  def my_map 
    result = []
    self.my_each do |elem|
      result << yield(elem)
    end
    result
  end
  def my_none? 
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_select 
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    index = 0
    while index < self.length
      yield(self[index])
      index += 1
    end
    self
  end
end