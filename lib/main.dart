import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/users.dart';
import 'providers/google_signin_bloc.dart';
import 'providers/password_bloc.dart';
import 'repositories/google_auth_repo.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/welcome/welcome_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      BlocProvider.of<AuthentificationBloc>(context).stream.listen((event) {
        if (event.requestState == RequestState.SIGNED) {
          print('------------ signed ---------');
          SchedulerBinding.instance.addPostFrameCallback((_) {
            navigatorKey.currentState
                .pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
          });
        } else if (event.requestState == RequestState.SIGNEDOUT) {
          navigatorKey.currentState
              .pushNamedAndRemoveUntil(LoginScreen.route, (route) => false);
        } else if (event.requestState == RequestState.NONE) {
          navigatorKey.currentState
              .pushNamedAndRemoveUntil(WelcomeScreen.route, (route) => false);
        }
        // else if(event.requestState == RequestState.ERROR){
        //   navigatorKey.currentState.pushNamed(Error.route);
        // }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        SignUpScreen.route: (context) => SignUpScreen(),
        HomeScreen.route: (context) => HomeScreen(),
      },
      initialRoute: WelcomeScreen.route,
      debugShowCheckedModeBanner: false,
      title: 'Authentification App',
      // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kDrakModeColor),
    );
  }
}
