import 'package:flutter/material.dart';

import '../constants.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    Key key,
    @required this.onTap,
    @required this.text,
  }) : super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
