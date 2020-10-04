import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorites_scren.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category_rounded,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite,
                ),
                text: 'favorite',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoriteScreen(),
        ],),
      ),
    );
  }
}
