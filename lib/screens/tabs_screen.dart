import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/favorite_screen.dart';
import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,dynamic>> _pageList = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'},
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:  Scaffold(
          appBar: AppBar(
            title: Text(_pageList[_selectedPageIndex]['title']),
          ),
          drawer: MainDrawer(),
          body: _pageList[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            onTap: _selectedPage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
            ],
          ),
        ),
    );
  }
}
