import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:providerfirebaseecom/app/services/global_methods.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/screens/wishlist/wishlist_widget.dart';

class WishlistScreen extends StatefulWidget {
  static const routeName = "/wishlistscreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Wishlist(2)",
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(
            IconlyBold.arrowLeft3,
            color: color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethods.warningDialog(
                context: context,
                title: "Empty your wishlist ?",
                subtitle: "Are you sure ?",
                fct: () {},
              );
            },
            icon: Icon(IconlyBroken.delete),
            color: color,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return WishlistWidget();
        },
      ),
    );
  }
}
