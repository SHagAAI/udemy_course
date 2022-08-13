import 'package:flutter/material.dart';

class Kategori {
  final String id;
  final String judul;
  final Color warna;

  const Kategori({
    @required this.id,
    @required this.judul,
    this.warna = Colors.orange,
  });
}
