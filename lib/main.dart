// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/view/consts/theme_data.dart';
import 'package:providerfirebaseecom/view/screens/feeds_screen/feeds_screen.dart';
import 'package:providerfirebaseecom/view/screens/order/order_screen.dart';
import 'package:providerfirebaseecom/view/screens/screens_shelf.dart';
import 'package:providerfirebaseecom/view/screens/viewed/viewed.dart';
import 'package:providerfirebaseecom/view/screens/viewed/viewed_widget.dart';
import 'package:providerfirebaseecom/view/screens/wishlist/wishlist_screen.dart';

import 'view/screens/on_sale/on_sale_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.setDarkTheme = await themeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProviderConsumer, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: Styles.themeData(
                isDarkTheme: themeProviderConsumer.getDarkTheme,
                context: context),
            home: BottomBar(),
            routes: {
              OnSaleScreen.routeName: (context) => OnSaleScreen(),
              FeedsScreen.routeName: (context) => FeedsScreen(),
              DetailScreen.productDetail: (context) => DetailScreen(),
              WishlistScreen.routeName: (context) => WishlistScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  ViewedRecentlyScreen(),
            },
          );
        },
      ),
    );
  }
}
