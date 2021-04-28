import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_login/screens/components/body.dart';
import 'package:mock_login/screens/home/home_screen.dart';
import 'package:mock_login/screens/login/login_screen.dart';
import 'package:mock_login/shared/components/email_text_field.dart';
import 'package:mock_login/shared/components/have_an_account.dart';
import 'package:mock_login/shared/components/or_divider.dart';
import 'package:mock_login/shared/components/password_text_field.dart';
import 'package:mock_login/shared/components/rounded_button.dart';
import 'package:mock_login/shared/components/social_medial_items.dart';
import '../../models/users.dart';

class SignUpScreen extends StatelessWidget {
  Users user = Users();
  var _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(
        topImage: Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/signup_top.png',
            width: size.width * 0.4,
          ),
        ),
        bottomImage: Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/main_bottom.png',
            width: size.width * 0.3,
          ),
        ),
        title: 'Sign Up',
        backgroundImage: SvgPicture.asset(
          'assets/icons/signup.svg',
          width: size.width * .6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailTextField(
              onChanged: (value) {
                user.setEmail(value);
              },
            ),
            PasswordTextField(
              onChanged: (value) {
                user.setPassword(value);
              },
              onSuffixTap: () {},
            ),
            RoundedButton(
              text: 'Sign Up',
              pressed: () {
                try {
                  _auth.createUserWithEmailAndPassword(
                      email: user.getEmail, password: user.getPassword);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } catch (e) {
                  print('##### Execption $e');
                }
              },
            ),
            HaveAnAccount(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              text: 'Already a memeber ? Sign in!',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            OrDivider(
              textSparator: 'Sign up with',
            ),
            SocialMediaItems()
          ],
        ),
      ),
    );
  }
}
