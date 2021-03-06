import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/view/cart/cart_screen.dart';
import 'package:providerfirebaseecom/view/categories/categories_screen.dart';
import 'package:providerfirebaseecom/view/home/home_screen.dart';
import 'package:providerfirebaseecom/view/user/user_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _pages = [
    {"page": HomeScreen(), "title": "Home Screen"},
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": CartScreen(), "title": "Cart"},
    {"page": UserScreen(), "title": "User Screen"},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]["title"]),
      //   centerTitle: true,
      // ),
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme
            ? Theme.of(context).cardColor
            : Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.category,
              ),
              label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.buy,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                IconlyBold.user3,
              ),
              label: "User"),
        ],
      ),
    );
  }
}
