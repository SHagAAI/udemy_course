import 'package:flutter/material.dart';
import '../screens/filter_screens.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String judul, IconData iconnya, Function tapHandler) {
    return ListTile(
      leading: Icon(
        iconnya,
        size: 26,
      ),
      title: Text(
        judul,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            "Makanan",
            Icons.restaurant,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            "Filter",
            Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FilterScreen.namaRoute);
            }
          )
        ],
      ),
    );
  }
}
