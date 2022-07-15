import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/view/consts/const_variables.dart';
import 'package:providerfirebaseecom/view/screens/detail/detail_screen.dart';
import '../../../app/services/global_methods.dart';
import '../../../app/services/utils.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: DetailScreen.productDetail);
      },
      leading: Image.network(
        testPic2,
        width: size.width * 0.2,
        fit: BoxFit.fill,
      ),
      title: Text(
        'Title  x12',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      ),
      trailing: Text(
        '03/08/2022',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      ),
    );
  }
}
