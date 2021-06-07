import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
    );
  }
}
