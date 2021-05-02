import 'package:flutter/material.dart';
import 'package:mock_login/shared/components/rounded_button.dart';
import 'package:mock_login/shared/constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key key, @required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.25,
              decoration: BoxDecoration(color: kPrimaryLightColor),
              child: Center(
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        RoundedButton(
            text: 'Go Back',
            pressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
