// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  List<Color> gridColors = [
    Color(0xFF53B175),
    Color(0xFFF8A55C),
    Color(0xFFF7A594),
    Color(0xFFD3B0E0),
    Color(0xFFFDE598),
    Color(0xFFB7DFF5),
  ];
  List<Map<String, dynamic>> catInfo = [];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 2,
      childAspectRatio: 240 / 250,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        6,
        (index) => CategoriesWidget(imageUrl: testPic, title: "Tunç",colorB: gridColors[index],),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  final Color colorB;
  final String imageUrl;
  final String title;
  CategoriesWidget({
    Key? key,
    required this.colorB,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: _screenWidth * 0.33,
        width: _screenWidth * 0.33,
        decoration: BoxDecoration(
          color: colorB.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorB, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  testPic,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
