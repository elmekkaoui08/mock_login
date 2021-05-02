import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: kPrimaryLightColor),
      child: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 40),
        unselectedIconTheme:
            IconThemeData(color: Colors.grey.shade500, size: 35),
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
      ),
    );
  }
}
