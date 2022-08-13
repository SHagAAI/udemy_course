import 'package:flutter/material.dart';
import '../models/makanan.dart';
import '../widgets/main_drawer.dart';
import './favorite_sceen.dart';
import './kategori_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Makanan> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // karena BottomTabBar ini manual, maka kita perlu
  // membuat list kita sendiri untuk menampung widget
  // apa saja yg ingin kita tampilkan
  List<Map<String, Object>> _halamanBawah;

  int _indexHalamanTerpilih = 0;

  void _pilihHalaman(int indexHalaman) {
    setState(() {
      _indexHalamanTerpilih = indexHalaman;
    });
  }

  @override
  void initState() {
    _halamanBawah = [
      {'halaman': KategoriScreen(), 'judul': 'Kategori'},
      {'halaman': FavoriteScreen(widget.favoriteMeals), 'judul': 'Favorit'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_halamanBawah[_indexHalamanTerpilih]['judul']),
      ),
      drawer: MainDrawer(),
      body: _halamanBawah[_indexHalamanTerpilih]['halaman'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _pilihHalaman,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,

        currentIndex: _indexHalamanTerpilih,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Kategori"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favoritku"),
        ],
      ),
    );
  }
}

// TabBar Yang ada di Atas =====>>>>
// DefaultTabController akan secara otomatis menghubungkan widget Tab()
// Yang dibutuhkan untuk menampilkan berdasarkan apa yang dipilih adalah menggunakan
// Widget TabBarView

// TabBar yang ada di bawah =====>>>>
// BottomNavigationBar membutuhkan function ontap untuk
// mengatur halaman mana yang akan ditampilkan
// BottomNavigationBar akan secara otomoatis mengirimkan
// index dari masing2 halaman ketika user memilih halaman

// Kalau menggunakan BottomNavigationBarType, perlu melakukan
// customisasi warna pada BottomNavigationBarItem
