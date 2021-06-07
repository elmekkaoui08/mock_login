import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components/rounded_button.dart';
import '../../shared/constants.dart';
import '../components/body.dart';
import '../login/login_screen.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static final route = '/welcome';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(
        topImage: Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_top.png',
            width: size.width * 0.3,
          ),
        ),
        bottomImage: Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/main_bottom.png',
            width: size.width * 0.2,
          ),
        ),
        backgroundImage: SvgPicture.asset(
          'assets/icons/chat.svg',
          width: size.width * 0.8,
        ),
        title: 'WeChat',
        child: Column(
          children: [
            SizedBox(
              height: size.height * .08,
            ),
            RoundedButton(
              text: 'Login',
              textColor: Colors.white,
              pressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.route, (route) => false);
              },
              buttonColor: kPrimaryColor,
            ),
            RoundedButton(
              text: 'Sign Up',
              textColor: Colors.black,
              pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              buttonColor: kPrimaryLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
