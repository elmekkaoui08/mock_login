import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_login/models/users.dart';
import 'package:mock_login/providers/google_signin_bloc.dart';
import 'package:mock_login/providers/password_bloc.dart';
import 'package:mock_login/repositories/google_auth_repo.dart';
import 'package:mock_login/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PasswordBloc(false)),
        BlocProvider(
          create: (_) => AuthentificationBloc(
            SigningState(
                user: Users(),
                requestState: RequestState.NONE,
                errorMessage: ''),
            GoogleAuthRepo(),
          ),
        ),
      ],
      child: AuthApp(),
    ),
  );
}

class AuthApp extends StatefulWidget {
  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  ThemeData theme = ThemeData.dark();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentification App',
      home: WelcomeScreen(),
      // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kDrakModeColor),
    );
  }
}
