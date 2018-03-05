module Enumerable

  def my_each
    for i in (0...self.length) do
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    for i in (0...self.length) do
      yield(self[i], i)
    end
    self
  end

  def my_select
    results = []

    self.my_each do |item|
      results << item if yield(item)
    end

    results
  end

  def my_all?
    self.my_each do |item|
      return false if !yield(item)
    end

    true
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end

    true
  end

  def my_count
    count = 0
    self.my_each do |item|
      count += 1 if yield(item)
    end

    count
  end

  def my_map(&map_proc)
    mapped = []
    self.my_each do |item|
      mapped << yield(item) if !map_proc
      mapped << map_proc.call(item)
    end

    mapped
  end

  def my_inject(initial = self[0])
    current = initial

    self.my_each do |item|
      next if initial == item
      current = yield(current, item)
    end

    current
  end

end

def multiply_els(array)
  result = array.my_inject { |a, b| a * b }
  return result
end

p multiply_els([1,2,3,4,5,6,7])
