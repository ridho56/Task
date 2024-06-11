import 'package:flutter/material.dart';

//!main color
const Color hijaumuda = Color(0xff73D2DE);
const Color merahtua = Color(0xff8F2D56);
const Color abuabu = Color(0xff4E4C4C);
const Color kuning = Color(0xffFFBC42);
const Color putih = Color(0xffFFFFFF);
const Color hitam = Color(0xff000000);

//* Kelas untuk warna dengan ID
class ColorWithId {
  final int id;
  final Color color;

  ColorWithId({required this.id, required this.color});
}

//* Daftar warna dengan ID
final List<ColorWithId> colorsWithId = [
  ColorWithId(id: 1, color: const Color(0xffFFBC42).withOpacity(0.2)),
  ColorWithId(id: 2, color: const Color(0xffD81159).withOpacity(0.2)),
  ColorWithId(id: 3, color: const Color(0xff73D2DE).withOpacity(0.2)),
  ColorWithId(id: 4, color: const Color(0xff218380).withOpacity(0.2)),
];

Color getColorByIndex(int index) {
  int normalizedIndex =
      index % colorsWithId.length; //* Mengubah index agar berulang
  return colorsWithId[normalizedIndex].color;
}
