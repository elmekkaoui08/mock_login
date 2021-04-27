import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_login/screens/components/body.dart';
import 'package:mock_login/screens/login/login_screen.dart';
import 'package:mock_login/screens/signup/signup_screen.dart';
import 'package:mock_login/shared/components/password_text_field.dart';
import 'package:mock_login/shared/components/rounded_button.dart';
import 'package:mock_login/shared/constants.dart';

class WelcomeScreen extends StatelessWidget {
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
        title: 'Welcome to EDU',
        child: Column(
          children: [
            RoundedButton(
              text: 'Login',
              textColor: Colors.white,
              pressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
            PasswordTextField(
              onChanged: (value) {},
              onSuffixTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
