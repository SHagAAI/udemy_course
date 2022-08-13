import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/makanan.dart';
import '../widgets/makanan_item.dart';
import '../models/makanan.dart';

class KategoriMenuScreen extends StatefulWidget {
  // tambahkan static const property
  // (properti ) yang dapat diakses TANPA mengintansiasi class
  // digunakan untuk assist pushName
  static const namaRoute = '/kategori-resep';
  final List<Makanan> availableMeals;

  KategoriMenuScreen(this.availableMeals);

  @override
  State<KategoriMenuScreen> createState() => _KategoriMenuScreenState();
}

class _KategoriMenuScreenState extends State<KategoriMenuScreen> {

  String judulKategori;
  List <Makanan> filterkategoriMakanan;
  bool _loadedInitData = false;



  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArgumen =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    judulKategori = routesArgumen['judulnya'];
    final kategoriId = routesArgumen['idnya'];

    filterkategoriMakanan = widget.availableMeals.where((e) {
      return e.kategori.contains(kategoriId);
    }).toList();
    _loadedInitData = true;
    }
    
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _hapusMakanan(String makananId) {
    setState(() {
      filterkategoriMakanan.removeWhere((element) => element.id == makananId);
    });
  }

  // final String kategoriId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judulKategori),
      ),
      body: ListView.builder(
        itemBuilder: (konteks, indexnya) {
          return MakananItem(
              id: filterkategoriMakanan[indexnya].id,
              judul: filterkategoriMakanan[indexnya].judul,
              imageUrl: filterkategoriMakanan[indexnya].imgUrl,
              durasiMasak: filterkategoriMakanan[indexnya].durasiMasak,
              kompleksitasnya: filterkategoriMakanan[indexnya].kompleksitas,
              harganya: filterkategoriMakanan[indexnya].hargaMakanan,
              );
        },
        itemCount: filterkategoriMakanan.length,
      ),
    );
  }
}
