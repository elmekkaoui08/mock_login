import 'package:flutter/material.dart';
import 'package:mock_login/screens/components/background.dart';

class Body extends StatelessWidget {
  final Widget child;
  final Widget backgroundImage;
  final String title;
  final Widget topImage;
  final Widget bottomImage;
  Body(
      {@required this.child,
      @required this.backgroundImage,
      @required this.title,
      @required this.topImage,
      @required this.bottomImage});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      topImage: topImage,
      bottomImage: bottomImage,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            backgroundImage,
            SizedBox(
              height: size.height * 0.01,
            ),
            child
            // SocialMediaItems()
          ],
        ),
      ),
    );
  }
}
