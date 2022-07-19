import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/classes/product.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/screens/detail/detail_screen.dart';
import 'package:providerfirebaseecom/view/screens/on_sale/on_sale_screen.dart';
import 'package:providerfirebaseecom/view/shared/bag_btn.dart';
import 'package:providerfirebaseecom/view/shared/heart_btn.dart';
import 'package:providerfirebaseecom/view/shared/price_widget.dart';

import '../../app/providers/cart_provider.dart';
import '../../app/providers/wishlist_provider.dart';
import '../../app/services/global_methods.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  TextEditingController quantityCountTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvider = Provider.of<Product>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    bool? isInCart = cartProvider.getCartItems.containsKey(productProvider.id);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool? isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(productProvider.id);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).pushNamed(DetailScreen.productDetail,
                arguments: productProvider.id);
          },
          child: Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      productProvider.imageUrl,
                      height: size.width * 0.20,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1 KG",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(children: [
                          BagButton(
                            isInCart: isInCart,
                            funcs: () {
                              cartProvider.addProductsToCart(
                                productId: productProvider.id,
                                quantity: int.parse(quantityCountTec.text),
                              );
                            },
                          ),
                          HeartButton(
                            productId: productProvider.id,
                            isInWishlist: isInWishlist,
                          )
                        ]),
                        PriceWidget(
                          price: productProvider.price,
                          textPrice: "1",
                          isOnSale: true,
                          salePrice: productProvider.salePrice,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          productProvider.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 15),
                        ),
                      ]),
                ]),
          ]),
        ),
      ),
    );
  }
}
