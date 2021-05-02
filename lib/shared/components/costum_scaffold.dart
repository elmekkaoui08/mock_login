import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_login/providers/google_signin_bloc.dart';
import 'package:mock_login/screens/login/login_screen.dart';
import 'package:mock_login/shared/components/saerch_bar.dart';
import 'package:mock_login/shared/components/stories.dart';
import '../constants.dart';
import 'bottom_nav_bar.dart';
import 'chat_items.dart';
import 'costum_title.dart';

class IndecatorScaffold extends StatelessWidget {
  const IndecatorScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Messages',
            style: GoogleFonts.tajawal(
              color: kPrimaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          AppBarAction(
            icon: Icons.message_rounded,
            onTap: () {
              BlocProvider.of<AuthentificationBloc>(context)
                  .add(SignOutEvent());
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
            },
          ),
          AppBarAction(
            icon: Icons.wb_sunny_outlined,
            onTap: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumTitle(
                    title: 'Activities',
                  ),
                  Stories(),
                  CostumTitle(
                    title: 'Messages',
                  ),
                  ChatItems(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
    );
  }
}
