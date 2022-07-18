import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/classes/product.dart';
import 'package:providerfirebaseecom/view/shared/feed_items.dart';

import '../../app/providers/provider_shelf.dart';
import '../../app/services/services_shelf.dart';
import '../screens/screens_shelf.dart';
import 'empty_products_widget.dart';

class CatScreen extends StatefulWidget {
  static const routeName = "/CatScreenState";
  const CatScreen({Key? key}) : super(key: key);

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).color;
    Size size = Utils(context: context).screenSize;
    final productProviders = Provider.of<ProductsProvider>(context);
    final catName = ModalRoute.of(context)!.settings.arguments as String;
    List<Product> productByCat = productProviders.findProdByCategory(catName);
    return Scaffold(
      appBar: AppBar(
        leading: BackWidget(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "All Products",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
      ),
      body: productByCat.isEmpty
          ? const EmptyProdWidget(
              text: 'No products belong to this category',
            )
          : SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: TextField(
                      focusNode: _searchTextFocusNode,
                      controller: _searchTextController,
                      onChanged: (valuee) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 1),
                        ),
                        hintText: "What's in your mind",
                        prefixIcon: const Icon(Icons.search),
                        suffix: IconButton(
                          onPressed: () {
                            _searchTextController!.clear();
                            _searchTextFocusNode.unfocus();
                          },
                          icon: Icon(
                            Icons.close,
                            color: _searchTextFocusNode.hasFocus
                                ? Colors.red
                                : color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  // crossAxisSpacing: 10,
                  childAspectRatio: size.width / (size.height * 0.70),
                  children: List.generate(productByCat.length, (index) {
                    return ChangeNotifierProvider.value(
                      value: productByCat[index],
                      child: FeedsItems(),
                    );
                  }),
                ),
              ]),
            ),
    );
  }
}
