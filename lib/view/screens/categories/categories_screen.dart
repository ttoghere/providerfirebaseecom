import 'package:flutter/material.dart';
import '../../../app/services/services_shelf.dart';
import '../../shared/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'images/cat/grains.png',
      'catText': 'Grains',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context: context);
    Color color = utils.color;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Categories",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10, // Vertical spacing
            mainAxisSpacing: 10, // Horizontal spacing
            children: List.generate(6, (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
              );
            }),
          ),
        ));
  }
}
