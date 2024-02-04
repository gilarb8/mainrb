# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

number : Array(Int32) = [0,1,2,3,4,5,7,8,9]
random : Array(Int32) = [0,20,321,512,7845,88] 

print -> (pilah_number : Array(Int32)){number.each do |pilah_number| puts "#{pilah_number}\n" end}.call(number)
puts "-----"
puts -> (pilah_random : Array(Int32)){random.each do |pilah_random| puts "#{pilah_random}" end}.call(random)
