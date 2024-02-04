# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

arr = %w[bandung jakarta surabaya]

arr.each do |sebut|
  case sebut
  when "bandung"
    puts "kota lalab eater #{sebut}"
  when "jakarta"
    puts "kota ondel-ondel #{sebut}"
  when "surabaya"
    puts "kota kue lapis harga sejuta #{sebut}"
  else
    puts "kota tidak teridentifikasi: #{sebut}"
  end
end
