# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

number = [0,1,2,3,4,5,7,8,9]
random = [0,20,321,512,7845,88] 

puts -> (pilah_number){number.each do |pilah_number| puts "#{pilah_number}" end}.call(number)
puts "-----"
puts -> (pilah_random){random.each do |pilah_random| puts "#{pilah_random}" end}.call(random)
