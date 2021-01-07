def my_each

	arr = ['h', 'e', 'l', 'l', 'o']
	max_length = arr.length

	# loop do
		max_length.times do |i|
			yield(arr[i])
		end
	# end

end

my_each {|e| puts e}