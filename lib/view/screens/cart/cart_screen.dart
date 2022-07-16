import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:providerfirebaseecom/app/services/global_methods.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/shared/cart_widget.dart';

import 'empty_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).color;
    Size size = Utils(context: context).screenSize;
    bool _isEmpty = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Cart(2)",
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethods.warningDialog(
                context: context,
                title: "Empty your cart?",
                subtitle: "Are you sure?",
                fct: () {},
              );
            },
            icon: Icon(IconlyBroken.delete),
            color: color,
          ),
        ],
      ),
      body: _isEmpty
          ? EmptyScreen(
              imagePath: testPic2,
              title: "Tunç Beyefendi",
              subtitle: "Güzel İnsan",
              buttonText: "Merhaba",
            )
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.1,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Order Now",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Total: \$18.24",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (ctx, index) {
                      return CartWidget();
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
