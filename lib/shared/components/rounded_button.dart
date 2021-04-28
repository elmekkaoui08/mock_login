import 'package:flutter/material.dart';
import 'package:mock_login/shared/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function pressed;

  const RoundedButton({
    @required this.text,
    this.textColor = Colors.white,
    @required this.pressed,
    this.buttonColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: size.width * 0.8,
      height: size.height * .08,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          ),
          onPressed: pressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/*FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          onPressed: pressed,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: buttonColor,
        )*/
