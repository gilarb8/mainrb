# MIT License
# Copyright (c) 2024 Gillar Ajie Prasatya
# See LICENSE file for details.

puts -> (x: Int32, y: Int32) {x * y + 1}.call(6,2)

# lambda versi crystal. kode diatas ditulis dalam bahasa Crystal menggunakan lambda,
# dengan parameter `x` dan `y`, yang harus bertipe data `Int32`
# ditulis `(x: Int32, y: Int32)`. Dalam blok lambda,
# dilakukan perkalian `(x * y + 1)`. setelah menjalankan
# lambda melalui `.call(6, 2)`, adalah 13. Angka 13 tersebut
# dicetak ke konsol menggunakan fungsi `puts`.
