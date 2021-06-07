import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../models/users.dart';
import '../../providers/google_signin_bloc.dart';
import '../../shared/components/costum_text_input.dart';
import '../../shared/components/email_text_field.dart';
import '../../shared/components/have_an_account.dart';
import '../../shared/components/or_divider.dart';
import '../../shared/components/password_text_field.dart';
import '../../shared/components/rounded_button.dart';
import '../../shared/constants.dart';
import '../components/body.dart';
import '../error/error_screen.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static final route = '/signup';
  final Users user = Users();
  @override
  Widget build(BuildContext context) {
    print('------------- Buildiing sign up screen --------------');
    final Size size = MediaQuery.of(context).size;
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
          CostumTextField(
              icon: Icons.person,
              hintText: 'Full name',
              onChange: (value) {
                user.name = value;
              }),
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
                context.read<AuthentificationBloc>().add(
                      SignUpWithEmailPasswordEvent(
                        email: user.getEmail,
                        password: user.getPassword,
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
          RoundedButton(
            text: 'Sign Up With Google',
            pressed: () {
              context.read<AuthentificationBloc>().add(SignInWithGoogleEvent());
            },
            isSignWithGoogle: true,
            buttonColor: kPrimaryLightColor,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
