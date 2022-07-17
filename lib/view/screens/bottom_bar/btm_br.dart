import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/view/screens/screens_shelf.dart';
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
              icon: Badge(
                toAnimate: true,
                shape: BadgeShape.circle,
                badgeColor: Colors.red[900]!,
                borderRadius: BorderRadius.circular(8),
                position: BadgePosition.topEnd(top: -7, end: -7),
                badgeContent: FittedBox(
                  child: Text(
                    "1",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                  ),
                ),
                child: Icon(
                  IconlyBold.buy,
                ),
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
