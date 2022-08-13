import 'package:flutter/material.dart';
import '../models/makanan.dart';
import '../widgets/makanan_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Makanan> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isNotEmpty) {
       return ListView.builder(
        itemBuilder: (konteks, indexnya) {
          return MakananItem(
              id: favoriteMeals[indexnya].id,
              judul: favoriteMeals[indexnya].judul,
              imageUrl: favoriteMeals[indexnya].imgUrl,
              durasiMasak: favoriteMeals[indexnya].durasiMasak,
              kompleksitasnya: favoriteMeals[indexnya].kompleksitas,
              harganya: favoriteMeals[indexnya].hargaMakanan,
              );
        },
        itemCount: favoriteMeals.length,
      );
    } else {
      return Center(
        child: Text('You Have No Favorite Yet - Try Adding Some'),
      );
    }
  }
}
