// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/shared/heart_btn.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final quantityControllerTEC = TextEditingController(text: "1");
  @override
  void dispose() {
    quantityControllerTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context: context).color;
    Size size = Utils(context: context).screenSize;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: size.width * 0.25,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  testPic2,
                  height: size.width * 0.21,
                  width: size.width * 0.21,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Row(
                      children: [
                        quantityController(
                          fct: () {},
                          icon: CupertinoIcons.plus,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: quantityControllerTEC,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                            ],
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  quantityControllerTEC.text = "1";
                                } else {
                                  return;
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        quantityController(
                          fct: () {},
                          icon: CupertinoIcons.minus,
                          color: Colors.red[900]!,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.cart_badge_minus,
                        color: Colors.red[900],
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    HeartButton(),
                    Text(
                      "\$0.29",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5,),
            ],
          ),
        ),
      ),
    );
  }
}

class quantityController extends StatelessWidget {
  quantityController({
    Key? key,
    required this.fct,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final Function fct;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct;
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
