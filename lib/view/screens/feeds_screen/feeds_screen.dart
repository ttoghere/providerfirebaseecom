import 'package:flutter/material.dart';
import 'package:providerfirebaseecom/app/services/utils.dart';
import 'package:providerfirebaseecom/view/shared/feed_items.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  static const String routeName = "/feeds";

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  TextEditingController searchTextController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  @override
  void dispose() {
    searchFocusNode.dispose();
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context: context).color;
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "All Products",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
                child: TextField(
                  focusNode: searchFocusNode,
                  controller: searchTextController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green[900]!, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green[900]!, width: 1),
                      ),
                      hintText: "What's on your mind ?",
                      prefixIcon: Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {
                          searchTextController.clear();
                          searchFocusNode.unfocus();
                        },
                        icon: Icon(
                          Icons.close,
                          color: searchFocusNode.hasFocus ? Colors.red : color,
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                childAspectRatio: size.width / (size.height * 0.70),
                children: List.generate(
                  16,
                  (index) => FeedsItems(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
