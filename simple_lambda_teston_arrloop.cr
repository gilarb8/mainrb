# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

number : Array(Int32) = [0,1,2,3,4,5,7,8,9]
random : Array(Int32) = [0,20,321,512,7845,88]

[-> { number.each { |pilah_number| puts "#{pilah_number}" } },
 -> { random.each { |pilah_random| puts "#{pilah_random}" } }].each { |lambda_expr| lambda_expr.call }

# Menggunakan array yang berisi dua lambda expression.
# Lambda pertama mencetak elemen-elemen dari array "number".
# Lambda kedua mencetak elemen-elemen dari array "random".
# Memanggil setiap lambda expression untuk mencetak elemen-elemen dari array.
