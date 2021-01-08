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
	
	# 1.
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

	# 2.
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
	
	# 3.
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

	# 4.
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

	# 5.
	def my_any?;
		iterate = self.length
		if block_given?;
			ary = []
			idx = 0
			loop do;
				ary << yield(self[idx])
				idx += 1
				break if idx == iterate;
			end
			any = false
			iterate.times do |idx|;
				if ary[idx] == true
					any = true
					break
				end
			end
			any = any == true ? true : false ;
			p any
		else
			p true
		end
	end

	# 8.
	def my_map
		ary = []  
		self.my_each do |elem|
			ary << yield(elem)
		end	
		p ary
		# ary
	end
end

arr = [1, 2, 3, 4, 5]
arr.my_each { |e| puts e }
arr.my_each_with_index { |v, i| puts "#{v} and #{i}" }
arr.my_select { |e| e != 2 }
arr.my_all? { |e| e == 2 }
%w[ant bear cat].my_all? { |word| word.length >= 3 }
%w[ant bear cat].my_any? { |word| word.length >= 4 }
arr.my_map { |e| e + 2 }