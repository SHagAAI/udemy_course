import 'package:flutter/material.dart';
import '../screens/resep_makanan_screen.dart';
import '../models/makanan.dart';

class MakananItem extends StatelessWidget {
  final String id;
  final String judul;
  final String imageUrl;
  final int durasiMasak;
  final Kompleksitas kompleksitasnya;
  final Harga harganya;

  const MakananItem({
    @required this.id,
    @required this.judul,
    @required this.imageUrl,
    @required this.durasiMasak,
    @required this.kompleksitasnya,
    @required this.harganya,
  });

  String get kompleksitasTeks {
    switch (kompleksitasnya) {
      case Kompleksitas.Mudah:
        return 'Mudah';
        break;
      case Kompleksitas.Menengah:
        return 'Menengah';
        break;
      case Kompleksitas.Ahli:
        return 'Ahli';
        break;
      default:
        return 'Belum Terdaftar';
    }
  }

  String get hargaMakanan {
    switch (harganya) {
      case Harga.Murah:
        return 'Murah';
        break;
      case Harga.Sedang:
        return 'Sedang';
        break;
      case Harga.Mahal:
        return 'Mahal';
        break;
      default:
        return 'Belum Terdaftar';
    }
  }

  void pilihMakanan(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      ResepMakananScreen.namaRoute,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        // hapusItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pilihMakanan(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black54,
                    ),
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      judul,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${durasiMasak} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${kompleksitasTeks}')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${hargaMakanan}')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Positioned merupakan widget khusus yang dapat dipakai 
// oleh widget Stack untuk mengatur posisi suatu widget
// dengan menggunakan bottom, top dll pada boundary
// dari stack itu sendiri
