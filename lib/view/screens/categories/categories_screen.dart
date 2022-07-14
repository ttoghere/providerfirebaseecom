// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';

import '../../shared/categories_widget.dart';

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
        (index) => CategoriesWidget(
          imageUrl: testPic2,
          title: "Tunç",
          colorB: gridColors[index],
        ),
      ),
    );
  }
}
