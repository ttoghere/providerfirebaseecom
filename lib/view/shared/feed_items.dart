import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:providerfirebaseecom/app/services/global_methods.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/screens/feeds_screen/feeds_screen.dart';
import 'package:providerfirebaseecom/view/shared/heart_btn.dart';
import 'package:providerfirebaseecom/view/shared/price_widget.dart';

class FeedsItems extends StatefulWidget {
  const FeedsItems({Key? key}) : super(key: key);

  @override
  State<FeedsItems> createState() => _FeedsItemsState();
}

class _FeedsItemsState extends State<FeedsItems> {
  TextEditingController saleCountEC = TextEditingController(text: "1");

  @override
  void dispose() {
    saleCountEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          GlobalMethods.navigateTo(
              context: context, routeName: FeedsScreen.routeName);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Image.network(
              testPic2,
              height: size.width * 0.22,
              width: size.width * 0.22,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Title",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 18),
                  ),
                  HeartButton(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: PriceWidget(
                            price: 5.9,
                            textPrice: saleCountEC.text,
                            isOnSale: true,
                            salePrice: 2.99,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              FittedBox(
                                child: Text(
                                  "KG",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  controller: saleCountEC,
                                  key: ValueKey("10"),
                                  style: TextStyle(fontSize: 16),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  enabled: true,
                                  onChanged: (value) {
                                    if (saleCountEC.text.isNotEmpty) {
                                      setState(() {});
                                    }
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9.]")),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                        onSurface: Theme.of(context).cardColor,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
