import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/app/services/global_methods.dart';
import 'package:providerfirebaseecom/view/screens/order/order_screen.dart';
import 'package:providerfirebaseecom/view/screens/viewed/viewed.dart';
import 'package:providerfirebaseecom/view/shared/theme_switch.dart';

import 'widgets/option_tile.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late TextEditingController _addressController;
  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hi,",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "My Name",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Email@email.com",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        OptionTile(
          title: "Address",
          subtitle: "Subtitle Here",
          onTap: () async {
            await _showAddressDialog();
          },
          icon: IconlyBold.user2,
        ),
        OptionTile(
          title: "Orders",
          subtitle: "Subtitle Here",
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: OrdersScreen.routeName);
          },
          icon: IconlyBold.bag2,
        ),
        OptionTile(
          title: "Viewed",
          subtitle: "Subtitle Here",
          onTap: () {
            GlobalMethods.navigateTo(
                context: context, routeName: ViewedRecentlyScreen.routeName);
          },
          icon: IconlyBold.show,
        ),
        OptionTile(
          title: "Forget Password",
          subtitle: "Subtitle Here",
          onTap: () {},
          icon: IconlyBold.unlock,
        ),
        ThemeSwitch(themeState: themeState),
        OptionTile(
          title: "Log Out",
          subtitle: "Subtitle Here",
          onTap: () async {
            GlobalMethods.warningDialog(
              context: context,
              title: "Sign Out",
              subtitle: "Do you want to sign out?",
              fct: () {},
            );
          },
          icon: IconlyBold.logout,
        ),
      ],
    );
  }

  Future<void> _showAddressDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Update",
        ),
        content: TextField(
          onChanged: (value) => _addressController.text = value,
          controller: _addressController,
          decoration: InputDecoration(hintText: "Your Address"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}
