import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app/providers/dark_theme_provider.dart';
import '../consts/const_variables.dart';

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
                  testPic2,
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
