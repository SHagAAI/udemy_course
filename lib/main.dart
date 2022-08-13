import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/makanan.dart';
import './screens/filter_screens.dart';
import './screens/tabs_screen.dart';
import 'screens/resep_makanan_screen.dart';
import './screens/kategori_menu__resep_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Makanan> _availableMeals = DUMMY_MEALS;
  List<Makanan> _favoriteMeals = [];

  // Buat Halaman Filter
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  
  void _setFilter(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element){
        if (_filters['gluten'] && !element.glutenFree) {
          return false;
        }

        if (_filters['lactose'] && !element.lactoseFree) {
          return false;
        }

        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }

        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  
  void _toggleFavorite(String mealId){
    final int existingIndex = _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleSmall: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      
      //home: KategoriScreen(),
      routes: {
        '/': (ctx) => TabScreen(_favoriteMeals),
        KategoriMenuScreen.namaRoute: (ctx) => KategoriMenuScreen(_availableMeals),
        ResepMakananScreen.namaRoute: (ctx) => ResepMakananScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.namaRoute: (ctx) => FilterScreen(_setFilter, _filters),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => KategoriMenuScreen(_availableMeals));
      },
      
    );
  }
}


//routes butuh map. Dimana map itu pake kurung kurawal {}