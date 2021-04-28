import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_login/providers/google_signin_bloc.dart';
import 'package:mock_login/screens/components/body.dart';
import 'package:mock_login/screens/home/home_screen.dart';
import 'package:mock_login/screens/signup/signup_screen.dart';
import 'package:mock_login/shared/components/email_text_field.dart';
import 'package:mock_login/shared/components/have_an_account.dart';
import 'package:mock_login/shared/components/password_text_field.dart';
import 'package:mock_login/shared/components/rounded_button.dart';
import 'package:provider/provider.dart';
import '../../models/users.dart';

class LoginScreen extends StatelessWidget {
  final Users user = Users();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthentificationBloc>(context);
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
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/images/login_bottom.png',
            width: size.width * 0.5,
          ),
        ),
        backgroundImage: SvgPicture.asset(
          'assets/icons/login.svg',
          width: size.width * 0.8,
        ),
        title: 'LOGIN',
        child: Column(
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
            ),
            RoundedButton(
              text: 'Login',
              pressed: () {
                authProvider.add(SignInEvent());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            HaveAnAccount(
              text: 'Don\'t have an account ? Create one!',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
