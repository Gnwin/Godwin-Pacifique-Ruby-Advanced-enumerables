class Array
  # def my_each
  # 	iterate = self.length
  # 	if block_given?
  # 		idx = 0
  # 		loop do
  # 			yield(self[idx])
  # 			idx += 1
  # 			break if idx == iterate;
  # 		end
  # 	else
  # 		p self
  # 	end
  # end

  def my_each
    max_length = length
    if block_given?
      max_length.times do |i|
        yield(self[i])
      end
    else
      p self
    end
  end

  def my_each_with_index
    iterate = length
    if block_given?
      idx = 0
      loop do
        yield(self[idx], idx)
        idx += 1
        break if idx == iterate
      end
    else
      p self
    end
  end
end

arr = [1, 2, 3, 4, 5]
# arr.my_each { |e| puts e }
arr.my_each_with_index { |v, i| puts "#{v} and #{i}" }
