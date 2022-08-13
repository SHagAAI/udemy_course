import 'package:flutter/material.dart';
import '../screens/kategori_menu__resep_screen.dart';

class KategoriItem extends StatelessWidget {
  final String id;
  final String judul;
  final Color warna;

  KategoriItem(this.id, this.judul, this.warna);

  void pilihKategori(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      KategoriMenuScreen.namaRoute,
      arguments: {
        'idnya': id,
        'judulnya': judul,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pilihKategori(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          judul,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              warna.withOpacity(0.7),
              warna,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}


// InkWell ini mirip seperti gesture detector tapi memiliki efek riak air.


//MaterialPageRoute => builder, fungsinya untuk menentukan widget mana yg ingin dibangun
//MaterialPageRoute => fullscreenDialog, (boolean) untuk menentukan apakah akan memakai default 
//                      animation ketika ada pergantian screen
//MaterialPageRoute => maintainState, 
//MaterialPageRoute => settings, 
