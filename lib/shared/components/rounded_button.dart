import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function pressed;
  final bool isSignWithGoogle;

  const RoundedButton({
    @required this.text,
    this.textColor = Colors.white,
    @required this.pressed,
    this.buttonColor = kPrimaryColor,
    this.isSignWithGoogle = false,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSignWithGoogle
                  ? Container(
                      margin: EdgeInsets.only(right: 20),
                      child: SvgPicture.asset(
                        'assets/icons/google-plus.svg',
                        width: size.width * 0.08,
                        color: Colors.red,
                      ),
                    )
                  : Container(),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
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
