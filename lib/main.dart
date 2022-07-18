// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/products_provider.dart';
import 'app/providers/provider_shelf.dart';
import 'view/consts/consts_shelf.dart';
import 'view/screens/screens_shelf.dart';

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
  ProductsProvider productsProvider = ProductsProvider();

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
        ChangeNotifierProvider.value(value: productsProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProviderConsumer, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: Styles.themeData(
                isDarkTheme: themeProviderConsumer.getDarkTheme,
                context: context),
            home: HomeScreen(),
            routes: {
              OnSaleScreen.routeName: (context) => OnSaleScreen(),
              FeedsScreen.routeName: (context) => FeedsScreen(),
              DetailScreen.productDetail: (context) => DetailScreen(),
              WishlistScreen.routeName: (context) => WishlistScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  ViewedRecentlyScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
            },
          );
        },
      ),
    );
  }
}
