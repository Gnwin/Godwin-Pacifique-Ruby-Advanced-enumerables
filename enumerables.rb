class Array
  # def my_each;
  #   max_length = self.length
  #   if block_given?;
  #     max_length.times do |i|;
  #       yield(self[i])
  #     end
  #   else
  #     p self
  #   end
	# end
	
	def my_each
  	iterate = self.length
  	if block_given?
  		idx = 0
  		loop do
  			yield(self[idx])
  			idx += 1
  			break if idx == iterate;
  		end
  	else
  		p self
  	end
  end

  def my_each_with_index
    iterate = self.length
    if block_given?
      idx = 0
      loop do
        yield(self[idx], idx)
        idx += 1
        break if idx == iterate;
      end
    else
      p self
    end
	end
	
	def my_select
		iterate = self.length
		if block_given?
			ary = []
			idx = 0
			loop do
				if yield(self[idx]) == true
					ary << self[idx]
				end
				idx = idx + 1
				break if idx == iterate;
			end
			p ary
		else
			p self
		end
	end

	def my_all?
		iterate = self.length
		if block_given?
			ary = []
			idx = 0
			loop do
				ary << yield(self[idx])
				idx += 1
				break if idx == iterate;
			end
			all = true
			iterate.times do |idx|
				if ary[idx] == false
					all = false
					break
				end
			end
			all = all == false ? false : true ;
			p all
		else
			p true
		end
	end
end

arr = [1, 2, 3, 4, 5]
arr.my_each { |e| puts e }
arr.my_each_with_index { |v, i| puts "#{v} and #{i}" }
arr.my_select { |e| e != 2 }
arr.my_all? { |e| e == 2 }
%w[ant bear cat].my_all? { |word| word.length >= 3 }