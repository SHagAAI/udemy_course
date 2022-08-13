import 'package:flutter/material.dart';
import '../dummy_data.dart';

class ResepMakananScreen extends StatelessWidget {
  static const namaRoute = '/resep-makanan';
  final Function toggleFavorite;
  final Function isFavorite;

  ResepMakananScreen(this.toggleFavorite, this.isFavorite);

  // Bikin method WIDGET baru buat menampilkan resep dan
  // cara masak biar lebih rapi
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  // Buat WIDGET sendiri untuk container bahan makanan
  // bisa aja dibuat di file beda, tapi karena
  // WIDGET yg akan dibuat ini hanya akan dipakai di
  // file ini aja maka RASANYA tidak masalah dibuat di 1 file
  Widget buildContainer(Widget child) {
    return Container(
      height: 197,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final makananId = ModalRoute.of(context).settings.arguments as String;
    final makananTerpilih =
        DUMMY_MEALS.firstWhere((element) => element.id == makananId);
    return Scaffold(
      appBar: AppBar(title: Text('${makananTerpilih.judul}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                makananTerpilih.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: buildSectionTitle(context, "Bahan - Bahan"),
            ),
            buildContainer(
              ListView.builder(
                itemCount: makananTerpilih.bahanMakanan.length,
                itemBuilder: (contextnya, indexnya) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      makananTerpilih.bahanMakanan[indexnya],
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, "Resep"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, idx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(idx + 1)}'),
                      ),
                      title: Text(makananTerpilih.resepMakanan[idx]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(makananId) ? Icons.star: Icons.star_border_outlined),
        onPressed: () => toggleFavorite(makananId),
      ),
    );
  }
}
