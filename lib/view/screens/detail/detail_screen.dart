import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/classes/product.dart';
import 'package:providerfirebaseecom/app/providers/cart_provider.dart';
import 'package:providerfirebaseecom/app/providers/provider_shelf.dart';
import 'package:providerfirebaseecom/app/providers/viewed_recently_provider.dart';
import '../../../app/providers/wishlist_provider.dart';
import '../../../app/services/services_shelf.dart';
import '../../consts/consts_shelf.dart';
import '../../shared/heart_btn.dart';

class DetailScreen extends StatefulWidget {
  static const productDetail = "/productdetail";
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _quantityTextController = TextEditingController(text: "1");
  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context: context).color;
    Size size = Utils(context: context).screenSize;
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<ProductsProvider>(context);
    final getCurrentProduct = productProvider.findProdById(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    bool? isInCart =
        cartProvider.getCartItems.containsKey(getCurrentProduct.id);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool? isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(getCurrentProduct.id);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        viewedProdProvider.addProductToHistory(productId: productId);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () =>
                  Navigator.canPop(context) ? Navigator.pop(context) : null,
              child: Icon(
                IconlyBold.arrowLeft2,
                color: color,
                size: 24,
              ),
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        body: Column(children: [
          Flexible(
            flex: 2,
            child: Image.network(
              getCurrentProduct.imageUrl,
              fit: BoxFit.scaleDown,
              width: size.width,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          getCurrentProduct.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 25),
                        )),
                        HeartButton(
                          productId: getCurrentProduct.id,
                          isInWishlist: isInWishlist,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getCurrentProduct.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.green, fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          getCurrentProduct.isPiece ? "KG" : "Piece",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: true,
                          child: Text(
                            '\$${getCurrentProduct.salePrice}',
                            style: TextStyle(
                                fontSize: 15,
                                color: color,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(63, 200, 101, 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Free delivery',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      quantityControl(
                        fct: () {
                          if (_quantityTextController.text == '1') {
                            return;
                          } else {
                            setState(() {
                              _quantityTextController.text =
                                  (int.parse(_quantityTextController.text) - 1)
                                      .toString();
                            });
                          }
                        },
                        icon: CupertinoIcons.minus,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _quantityTextController,
                          key: const ValueKey('quantity'),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                          ),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.green,
                          enabled: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                _quantityTextController.text = '1';
                              } else {}
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      quantityControl(
                        fct: () {
                          setState(() {
                            _quantityTextController.text =
                                (int.parse(_quantityTextController.text) + 1)
                                    .toString();
                          });
                        },
                        icon: CupertinoIcons.plus,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${(getCurrentProduct.price * int.parse(_quantityTextController.text)).toStringAsFixed(2)}"),
                              SizedBox(
                                height: 5,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text("x ${_quantityTextController.text}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: isInCart
                                  ? null
                                  : () {
                                      cartProvider.addProductsToCart(
                                        productId: getCurrentProduct.id,
                                        quantity: int.parse(
                                            _quantityTextController.text),
                                      );
                                    },
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  isInCart ? "In Cart" : "Add To Cart",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget quantityControl(
      {required Function fct, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: color,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            )),
      ),
    );
  }
}
