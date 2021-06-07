import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_login/screens/widgets/calls_widget.dart';
import 'package:mock_login/screens/widgets/camera_widget.dart';
import 'package:mock_login/screens/widgets/chat_widget.dart';
import 'package:mock_login/screens/widgets/settings_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../providers/google_signin_bloc.dart';
import '../../shared/components/costum_home_appbar.dart';
import '../../shared/constants.dart';
import '../error/error_screen.dart';

class HomeScreen extends StatefulWidget {
  static final route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    ChatWidget(),
    CallsWidget(),
    CameraWidget(),
    SettingWidget(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('index: $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('------------- Buildiing home screen --------------');
    final size = MediaQuery.of(context).size;
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
              icon: Icons.logout,
              onTap: () {
                BlocProvider.of<AuthentificationBloc>(context)
                    .add(SignOutEvent());
              },
            ),
          ],
        ),
        body: BlocBuilder<AuthentificationBloc, SigningState>(
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: state.requestState == RequestState.SIGNING,
            child: state.requestState == RequestState.ERROR
                ? ErrorScreen(errorMessage: state.errorMessage)
                : _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/chat_icon.svg',
                  width: size.width * 0.08,
                  color: kPrimaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/phone_icon.svg',
                  width: size.width * 0.08,
                  color: kPrimaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/camera_icon.svg',
                  width: size.width * 0.08,
                  color: kPrimaryColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/settings_icon.svg',
                  width: size.width * 0.08,
                  color: kPrimaryColor,
                ),
                label: '')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          elevation: 0,
        ));
  }
}
