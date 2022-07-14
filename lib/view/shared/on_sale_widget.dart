import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/screens/on_sale/on_sale_screen.dart';
import 'package:providerfirebaseecom/view/shared/bag_btn.dart';
import 'package:providerfirebaseecom/view/shared/heart_btn.dart';
import 'package:providerfirebaseecom/view/shared/price_widget.dart';

import '../../app/services/global_methods.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: OnSaleScreen.routeName);
          },
          child: Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      testPic2,
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
                        Row(children: [BagButton(), HeartButton()]),
                        PriceWidget(
                          price: 5.9,
                          textPrice: "1",
                          isOnSale: true,
                          salePrice: 2.99,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Product Title",
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
