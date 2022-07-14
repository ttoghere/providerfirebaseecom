import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/shared/on_sale_widget.dart';

class OnSaleScreen extends StatelessWidget {
  OnSaleScreen({Key? key}) : super(key: key);
  static String routeName = "/onsale";

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Products On Sale",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Text("No Products on sale yet!.\n Try again later"),
            )
          : GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(
                16,
                (index) => OnSaleWidget(),
              ),
            ),
    );
  }
}
