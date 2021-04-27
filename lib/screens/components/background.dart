import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.child,
    @required this.topImage,
    @required this.bottomImage,
  }) : super(key: key);

  final Widget child;
  final Widget topImage;
  final Widget bottomImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          topImage,
          bottomImage,
          SafeArea(child: child),
        ],
      ),
    );
  }
}
