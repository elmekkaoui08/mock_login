import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_login/providers/google_signin.dart';
import 'package:mock_login/screens/home/home_screen.dart';
import 'package:mock_login/shared/constants.dart';
import 'package:provider/provider.dart';

class SocialMediaItems extends StatelessWidget {
  const SocialMediaItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaItem(
          onTap: () {},
          svgPath: 'assets/icons/facebook.svg',
        ),
        SocialMediaItem(
          onTap: () async {
            final googleSignIn =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            // googleSignIn.logout();
            await googleSignIn.login();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (route) => false);

            print('Connected !');
          },
          svgPath: 'assets/icons/google-plus.svg',
        ),
        SocialMediaItem(
          onTap: () {},
          svgPath: 'assets/icons/twitter.svg',
        ),
      ],
    );
  }
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    Key key,
    @required this.svgPath,
    @required this.onTap,
  }) : super(key: key);

  final String svgPath;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          svgPath,
          color: kPrimaryColor,
          width: size.width * 0.04,
        ),
      ),
    );
  }
}
