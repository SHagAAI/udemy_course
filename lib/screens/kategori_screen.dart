import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/kateogori_item.dart';

class KategoriScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((e) => KategoriItem(
                e.id,
                e.judul,
                e.warna,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}

// SliverGridDelegateWithMaxCrossAxisExtent
// Bisa bantu untuk mendefine width dari grid yang nanti akan di buat

// childAspectRatio
// height and width relation
