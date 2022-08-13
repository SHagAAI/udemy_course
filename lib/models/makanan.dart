import 'package:flutter/foundation.dart';

enum Kompleksitas { Mudah, Menengah, Ahli }

enum Harga { Murah, Sedang, Mahal }

class Makanan {
  final String id;
  final List<String> kategori;
  final String judul;
  final String imgUrl;
  final List<String> bahanMakanan;
  final List<String> resepMakanan;
  final int durasiMasak;
  final Kompleksitas kompleksitas;
  final Harga hargaMakanan;
  final bool glutenFree;
  final bool lactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Makanan(
      {@required this.id,
      @required this.kategori,
      @required this.judul,
      @required this.imgUrl,
      @required this.bahanMakanan,
      @required this.resepMakanan,
      @required this.durasiMasak,
      @required this.kompleksitas,
      @required this.hargaMakanan,
      @required this.glutenFree,
      @required this.lactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
