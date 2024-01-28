# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

require 'tzinfo'
require 'date'

def get_time(city, timezone)
  time = Time.now.utc
  local_time = TZInfo::Timezone.get(timezone).utc_to_local(time)

  time_str = local_time.strftime("%H:%M:%S")
  date_str = local_time.strftime("%A, %B %d, %Y")

  puts "#{city} time: #{time_str}"
  puts "Actual date: #{date_str}"
end

def main
  begin
    puts "Welcome to the Realtime Clock Application!"
    puts "-----------------------------------------"

    loop do
      # Jakarta (WIB - Western Indonesian Time)
      get_time('Jakarta', 'Asia/Jakarta')

      # Tokyo (JST - Japan Standard Time)
      get_time('Tokyo', 'Asia/Tokyo')

      # London (GMT - Greenwich Mean Time)
      get_time('London', 'Europe/London')

      # Mecca (AST - Arabia Standard Time)
      get_time('Mecca', 'Asia/Riyadh')

      puts "Press Ctrl + C to exit..."
      sleep(1)
      system('clear') || system('cls')
    end
  rescue Interrupt
    puts "\nExiting the Realtime Clock Application. Goodbye!"
  rescue => e
    puts "An error occurred: #{e.message}"
  end
end

main

# Kota yang ditampilkan adalah : Jakarta, Tokyo, London, Mecca
# silahkan teman-teman tambahkan kota yang lain sesuai gmtnya, googling aja gmtnya
#
# Install terlebih dahulu library tzinfo nya :
#
# gem install tzinfo
#
# atau
#
# sudo gem install tzinfo
