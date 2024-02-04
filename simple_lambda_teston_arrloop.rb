# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

number = [0,1,2,3,4,5,7,8,9]
random = [0,20,321,512,7845,88]

lamd_loop = -> (pilah_number) do
	pilah_number.each { |pilah| puts "#{pilah}"}
	end

lamd_loop.call(number)
puts "-----"
lamd_loop.call(random)
