import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorites_scren.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages =[
    {'page': CategoriesScreen(), 'title': 'categories'},
    {'page':FavoriteScreen(), 'title': 'favorite'},
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),

        ),
        body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(icon: Icon( Icons.category),
          title:Text('categories'),
          ),
          BottomNavigationBarItem(icon: Icon( Icons.favorite),
            title:Text('favorite'),
          ),
        ],
      ),
      );

  }
}
