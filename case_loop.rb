arr = %w[bandung jakarta surabaya]

arr.each do |sebut|
  case sebut
  when "bandung"
    puts "kota lalab eater #{sebut}"
  when "jakarta"
    puts "kota ondel-ondel #{sebut}"
  when "surabaya"
    puts "kota jawir #{sebut}"
  else
    puts "kota tidak teridentifikasi: #{sebut}"
  end
end
