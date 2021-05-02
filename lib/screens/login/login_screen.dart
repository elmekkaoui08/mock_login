import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_login/providers/google_signin_bloc.dart';
import 'package:mock_login/screens/components/body.dart';
import 'package:mock_login/screens/error/error_screen.dart';
import 'package:mock_login/screens/home/home_screen.dart';
import 'package:mock_login/screens/signup/signup_screen.dart';
import 'package:mock_login/shared/components/email_text_field.dart';
import 'package:mock_login/shared/components/have_an_account.dart';
import 'package:mock_login/shared/components/or_divider.dart';
import 'package:mock_login/shared/components/password_text_field.dart';
import 'package:mock_login/shared/components/rounded_button.dart';
import 'package:mock_login/shared/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../models/users.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Users user = Users();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<AuthentificationBloc>().stream.listen((event) {
      print('---------- Stream called ----------------');
      if (event.requestState == RequestState.SIGNED) {
        //Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
    print('------------------------ building ----------------');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AuthentificationBloc, SigningState>(
        builder: (context, state) => ModalProgressHUD(
          inAsyncCall: state.requestState == RequestState.SIGNING,
          child: state.requestState == RequestState.ERROR
              ? ErrorScreen(errorMessage: state.errorMessage)
              : _buildBody(size, context),
        ),
      ),
    );
  }

  Body _buildBody(Size size, BuildContext context) {
    return Body(
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
      child: Form(
        key: _formKey,
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
                if (_formKey.currentState.validate()) {
                  print('Form is valid');
                } else {
                  print('form is invalid');
                }
                // context.read<AuthentificationBloc>().add(
                //       SignInWithEmailPasswordEvent(
                //         email: user.getEmail,
                //         password: user.getPassword,
                //       ),
                //     );
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            HaveAnAccount(
              text: 'Don\'t have an account ? Create one!',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            OrDivider(
              textSparator: 'Sign in with',
            ),
            RoundedButton(
              text: 'Sign In With Google',
              pressed: () {
                context
                    .read<AuthentificationBloc>()
                    .add(SignInWithGoogleEvent());
              },
              isSignWithGoogle: true,
              buttonColor: kPrimaryLightColor,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
