import 'package:flutter/material.dart';
import '../../../app/services/global_methods.dart';
import '../../../app/services/utils.dart';
import '../feeds_screen/feeds_screen.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText})
      : super(key: key);
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).color;
    final themeState = Utils(context: context).getTheme;
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.network(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Whoops!',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      color: Colors.purple[900],
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      color: Colors.purple[900],
                    ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: color,
                    ),
                  ),
                  primary: Theme.of(context).colorScheme.secondary,
                  // onPrimary: color,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                onPressed: () {
                  GlobalMethods.navigateTo(
                      context: context, routeName: FeedsScreen.routeName);
                },
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 20,
                        color: Colors.purple[900],
                      ),
                ),
              ),
            ]),
      )),
    );
  }
}
