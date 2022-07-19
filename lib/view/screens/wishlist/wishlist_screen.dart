import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/wishlist_provider.dart';
import 'package:providerfirebaseecom/app/services/global_methods.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/screens/screens_shelf.dart';
import 'package:providerfirebaseecom/view/screens/wishlist/wishlist_widget.dart';

import '../../consts/consts_shelf.dart';

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
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItemsList =
        wishlistProvider.getWishlistItems.values.toList().reversed.toList();

    return wishlistItemsList.isEmpty
        ? EmptyScreen(
            imagePath: testPic2,
            title: "Tunç Beyefendi",
            subtitle: "Güzel İnsan",
            buttonText: "Shop Now",
          )
        : Scaffold(
            appBar: AppBar(
                centerTitle: true,
                leading: const BackWidget(
                  color: Colors.red,
                ),
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(
                  'Wishlist (${wishlistItemsList.length})',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 22),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      GlobalMethods.warningDialog(
                          title: 'Empty your wishlist?',
                          subtitle: 'Are you sure?',
                          fct: () {
                            wishlistProvider.clearWishlist();
                          },
                          context: context);
                    },
                    icon: Icon(
                      IconlyBroken.delete,
                      color: color,
                    ),
                  ),
                ]),
            body: GridView.builder(
              itemCount: wishlistItemsList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: wishlistItemsList[index], child: WishlistWidget());
              },
            ),
          );
  }
}
