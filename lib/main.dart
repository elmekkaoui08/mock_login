import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_login/providers/password_bloc.dart';
import 'package:mock_login/providers/password_cubit.dart';
import 'package:mock_login/screens/welcome/welcome_screen.dart';
import 'package:mock_login/shared/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    /*MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PasswordNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoogleSignInProvider(),
        )
      ],
      child: AuthApp(),
    ),*/
    MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => PasswordCubit(false)),
        BlocProvider(create: (_) => PasswordBloc(true)),
      ],
      child: AuthApp(),
    ),
  );
}

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentification App',
      home: WelcomeScreen(),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
    );
  }
}
