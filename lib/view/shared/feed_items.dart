// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/services/global_methods.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/screens/detail/detail_screen.dart';
import 'package:providerfirebaseecom/view/shared/heart_btn.dart';
import 'package:providerfirebaseecom/view/shared/price_widget.dart';
import '../../app/classes/classes_shelf.dart';

class FeedsItems extends StatefulWidget {
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
    final productProvier = Provider.of<Product>(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(DetailScreen.productDetail,
              arguments: productProvier.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Image.network(
              productProvier.imageUrl,
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
                  Flexible(
                    flex: 3,
                    child: Text(
                      productProvier.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Flexible(flex: 1, child: HeartButton()),
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
                            price: productProvier.price,
                            textPrice: saleCountEC.text,
                            isOnSale: true,
                            salePrice: productProvier.salePrice,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                productProvier.isPiece ? "Piece" : "Kg",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 16,
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
