import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/viewed_recently_provider.dart';
import 'package:providerfirebaseecom/view/consts/consts_shelf.dart';

import '../../../app/services/services_shelf.dart';
import '../screens_shelf.dart';
import 'viewed_widget.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';

  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyScreenState createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context: context).color;
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    final viewedProdItemList = viewedProdProvider.getViewedProdlistItems.values
        .toList()
        .reversed
        .toList();
    if (viewedProdItemList.isEmpty) {
      return EmptyScreen(
          imagePath: testPic2,
          title: "Your history is empty",
          subtitle: "No products has been viewed yet",
          buttonText: "Shop Now");
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: 'Empty your history?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            )
          ],
          leading: BackWidget(
            color: color,
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "History",
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
        body: ListView.builder(
            itemCount: viewedProdItemList.length,
            itemBuilder: (ctx, index) {
              return  Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                  child: ChangeNotifierProvider.value(
                    value: viewedProdItemList[index],
                    child: ViewedRecentlyWidget(),
                  ),
                ),
              );
            }),
      );
    }
  }
}
