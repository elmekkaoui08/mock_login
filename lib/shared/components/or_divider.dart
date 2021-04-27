import 'package:flutter/material.dart';

import '../constants.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Row(
        children: [
          expandedDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'OR',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor),
            ),
          ),
          expandedDivider()
        ],
      ),
    );
  }

  Expanded expandedDivider() {
    return Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: 2,
      ),
    );
  }
}
