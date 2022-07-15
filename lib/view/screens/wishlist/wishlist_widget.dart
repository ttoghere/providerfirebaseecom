import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:providerfirebaseecom/view/screens/detail/detail_screen.dart';
import 'package:providerfirebaseecom/view/shared/heart_btn.dart';
import '../../../app/services/global_methods.dart';
import '../../../app/services/utils.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).color;
    final Size size = Utils(context: context).screenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              routeName: DetailScreen.productDetail, context: context);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: size.width * 0.2,
                height: size.width * 0.25,
                child: Image.network(
                  'https://i.ibb.co/F0s3FHQ/Apricots.png',fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        const HeartButton(),
                      ],
                    ),
                  ),
                  Flexible(
                      child: Text(
                    "Title",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18, color: color),
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$2.59",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, color: color),
                  )
                  // TextWidget(
                  //   text: '\$2.59',
                  //   color: color,
                  //   textSize: 18.0,
                  //   maxLines: 1,
                  //   isTitle: true,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
