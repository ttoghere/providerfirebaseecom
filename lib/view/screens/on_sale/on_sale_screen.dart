import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/classes/product.dart';
import 'package:providerfirebaseecom/app/providers/provider_shelf.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/shared/on_sale_widget.dart';

class OnSaleScreen extends StatelessWidget {
  OnSaleScreen({Key? key}) : super(key: key);
  static String routeName = "/onsale";

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvider = Provider.of<ProductsProvider>(context);
    List<Product> productsOnSale = productProvider.getOnSaleProducts;
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
      body: !productsOnSale.isEmpty
          ? GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(
                productsOnSale.length,
                (index) => ChangeNotifierProvider.value(
                  value: productsOnSale[index],
                  child: OnSaleWidget(),
                ),
              ),
            )
          : 
          Center(child: Text("No products on sale"),)
    );
  }
}
