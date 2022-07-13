import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/dark_theme_provider.dart';
import 'package:providerfirebaseecom/view/shared/theme_switch.dart';
import 'package:providerfirebaseecom/view/user/widgets/option_tile.dart';

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
          onTap: () {},
          icon: IconlyBold.bag2,
        ),
        OptionTile(
          title: "Wishlist",
          subtitle: "Subtitle Here",
          onTap: () {},
          icon: IconlyBold.heart,
        ),
        OptionTile(
          title: "Viewed",
          subtitle: "Subtitle Here",
          onTap: () {},
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
            _logOutDialog();
          },
          icon: IconlyBold.logout,
        ),
      ],
    );
  }

  Future<void> _logOutDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Sign Out",
          textAlign: TextAlign.center,
        ),
        content: Text("Do you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              "No",
              style: TextStyle(color: Colors.red[900]),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Yes",              style: TextStyle(color: Colors.green[900]),
),
          ),
        ],
      ),
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
