import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/shared/feed_items.dart';
import 'package:providerfirebaseecom/view/shared/on_sale_widget.dart';
import '../../../app/classes/classes_shelf.dart';
import '../../../app/providers/products_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  List<Widget> imageSliders = [];

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvier = Provider.of<ProductsProvider>(context);
    List<Product> allProducts = productProvier.getProducts;
    List<Product> onSaleProducts = productProvier.getOnSaleProducts;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
                items: List.generate(
                  6,
                  (index) => testSlider(context),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("View All"),
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      Text(
                        "On Sale".toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          shadows: [
                            Shadow(
                              color: Utils(context: context).color,
                              offset: Offset(0, -0.5),
                              blurRadius: 15,
                            ),
                          ],
                          color: Colors.red[900],
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        IconlyBold.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: Utils(context: context).screenSize.height * 0.2,
                    child: ListView.builder(
                      itemCount: onSaleProducts.length>10?onSaleProducts.length:10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (contect, index) {
                        return ChangeNotifierProvider.value(
                          value: onSaleProducts[index],
                            child: OnSaleWidget());
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Our Products",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Browse All",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.6,
              child: GridView.count(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: size.width / (size.height * 0.75),
                children: List.generate(
                    allProducts.length > 4 ? allProducts.length : 4, (index) {
                  return ChangeNotifierProvider.value(
                    value: allProducts[index],
                    child: FeedsItems(),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget testSlider(BuildContext context) {
    return Container(
      height: Utils(context: context).screenSize.height * 0.5,
      width: Utils(context: context).screenSize.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(testPic2),
        ),
      ),
    );
  }
}
