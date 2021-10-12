module Enumerable
  
  def my_each
      if self.is_a?(Hash)
          for k,v in self do
              yield k, v
          end
      else
          for item in self do
              yield item
          end
      end
  end

  def my_each_with_index
      for i in 0..self.length
          yield self[i], i
      end
  end

  def my_select
      if self.is_a?(Hash)
          hash = {}
          my_each { |k, v| hash[k] = v if yield(k, v) }
          hash
      else
          arr = []
          my_each { |item| arr << item if yield(item) }
          arr
      end
  end

  def my_all?
      if self.is_a?(Hash)
          self.my_each {|k, v|return false unless yield(k,v)}
      else
          self.my_each {|item|return false unless yield(item)}
      end
      true
  end

  def my_any?
      if self.is_a?(Hash)
          self.my_each {|k, v|return true if yield(k,v)}
      else
          self.my_each {|item|return true if yield(item)}
      end
      false
  end

  def my_none?
      if self.is_a?(Hash)
          self.my_each {|k, v|return false if yield(k,v)}
      else
          self.my_each {|item|return false if yield(item)}
      end
      true
  end

  def my_count
      count = 0
      if is_a?(Hash)
          my_each { |k, v| count += 1 if yield(k, v) } if is_a?(Hash)
      else
          my_each { |item| count += 1 if yield(item) }
      end
      count
  end

  def my_map
      arr = []
      if is_a?(Hash)
          my_each { |k, v| arr << yield(k, v) } if is_a?(Hash)
      else
          my_each { |item| arr << yield(item) }
      end
      arr
  end

  def my_inject
      sum = 0
      if self[0].is_a?(String)
          sum = ''
      end
      my_each { |item| sum = yield(sum, item) }
      sum
  end

  def my_map_proc(proc)
      arr = []
      my_each { |item| arr << proc.call(item) }
      arr
  end

  def my_map_both(arg = nil)
      arr = []
      if arg.is_a?(Proc)
          my_each { |item| arr << arg.call(item) }
      elsif block_given? && Proc != arg
          my_each { |item| arr << yield(item) }
      end
      arr
  end
end