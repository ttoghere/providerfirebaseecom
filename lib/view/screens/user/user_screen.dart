import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:providerfirebaseecom/app/providers/provider_shelf.dart';
import 'package:providerfirebaseecom/app/services/services_shelf.dart';
import 'package:providerfirebaseecom/view/screens/screens_shelf.dart';
import 'package:providerfirebaseecom/view/shared/loading_manager.dart';
import 'package:providerfirebaseecom/view/shared/theme_switch.dart';
import '../../consts/firebase_consts.dart';
import 'widgets/option_tile.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late TextEditingController _addressController;
  bool _isLoading = false;
  String? _email;
  String? _name;
  String? _address;
  @override
  void initState() {
    super.initState();
    getUserDate();
    _addressController = TextEditingController(text: "");
  }

  final User? user = authInstance.currentUser;
  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
  }

  Future<void> getUserDate() async {
    setState(() {
      _isLoading = true;
    });
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      String _uid = user!.uid;
      final DocumentSnapshot? userDoc =
          await FirebaseFirestore.instance.collection("users").doc(_uid).get();
      if (userDoc == null) {
        return;
      } else {
        _email = userDoc.get("email");
        _name = userDoc.get("name");
        _address = userDoc.get("shipping-address");
        _addressController.text = userDoc.get("shipping-address");
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      GlobalMethods.errorDialog(context: context, subtitle: error.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return LoadingManager(
      isLoading: _isLoading,
      child: ListView(
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
                      _name == null ? "User" : _name.toString(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  _email == null ? "Email@email.com" : _email.toString(),
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
            subtitle: _address == null ? "address" : _address.toString(),
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
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgetPasswordScreen()));
            },
            icon: IconlyBold.unlock,
          ),
          ThemeSwitch(themeState: themeState),
          OptionTile(
            title: user == null ? "Log in" : "Log Out",
            subtitle: "Subtitle Here",
            onTap: () async {
              GlobalMethods.warningDialog(
                context: context,
                title: user == null ? "Sign In" : "Sign Out",
                subtitle: user == null
                    ? "Do you want to sign in?"
                    : "Do you want to sign out?",
                fct: () {
                  if (user == null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                  authInstance.signOut().then((value) => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen())));
                },
              );
            },
            icon: user == null ? IconlyBold.login : IconlyBold.logout,
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
            onPressed: () async {
              String uid = user!.uid;
              try {
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(uid)
                    .update({"shipping-address": _addressController.text});
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserScreen()));
              } catch (error) {
                GlobalMethods.errorDialog(
                    context: context, subtitle: error.toString());
              }
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}
