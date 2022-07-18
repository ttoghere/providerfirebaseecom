import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/view/screens/screens_shelf.dart';
import '../../../app/services/services_shelf.dart';

class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyWidgetState createState() => _ViewedRecentlyWidgetState();
}

class _ViewedRecentlyWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context: context).color;
    Size size = Utils(context: context).screenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              context: context, routeName: DetailScreen.productDetail);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://i.ibb.co/F0s3FHQ/Apricots.png",
              fit: BoxFit.fill,
              height: size.width * 0.27,
              width: size.width * 0.25,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              children: [
                Text(
                  "Title",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "\$12.88",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
                child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
