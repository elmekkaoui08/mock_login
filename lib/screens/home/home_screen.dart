import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_login/dummy_data/data.dart';
import 'package:mock_login/providers/google_signin_bloc.dart';
import 'package:mock_login/screens/login/login_screen.dart';
import 'package:mock_login/shared/components/costum_text_input.dart';
import 'package:mock_login/shared/components/single_item_chat.dart';
import 'package:mock_login/shared/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthentificationBloc>(context);
    Size size = MediaQuery.of(context).size;

    _homeScreenScaffold() {
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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  authProvider.add(SignOutEvent());
                  authProvider.stream.listen((state) {
                    if (state.requestState == RequestState.SIGNEDOUT) {
                      print('-------------- Change distination ----------');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }
                  });
                },
                child: Icon(
                  Icons.message,
                  color: kPrimaryColor,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CostumTextField(
                onChange: (value) {},
                hintText: 'Search',
                icon: Icons.search,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: Text(
                        'Activities',
                        style: GoogleFonts.tajawal(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _stories(),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: Text(
                        'Messages',
                        style: GoogleFonts.tajawal(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        usersList.length,
                        (index) => SingleItemChatPage(
                          user: usersList[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 40),
          unselectedIconTheme:
              IconThemeData(color: Colors.grey.shade500, size: 35),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.call_rounded,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_enhance_outlined,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: '')
          ],
        ),
      );
    }

    return BlocBuilder<AuthentificationBloc, SigningState>(
      builder: (context, state) {
        if (state.requestState == RequestState.SIGNING) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.requestState == RequestState.ERROR) {
          return Scaffold(
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error : ${state.errorMessage}'),
                ],
              ),
            ),
          );
        } else if (state.requestState == RequestState.SIGNED) {
          return _homeScreenScaffold();
        } else {
          return Scaffold(
            body: Container(
              height: 0,
              width: 0,
            ),
          );
        }
      },
    );
  }

  _stories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kPrimaryLightColor),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 33,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    'Your Story',
                    overflow: TextOverflow.ellipsis,
                  )),
                )
              ],
            ),
          ),
          Row(
              children: List.generate(storyList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        storyList[index]['hasStory']
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kPrimaryColor, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                storyList[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            storyList[index]['imageUrl']),
                                        fit: BoxFit.cover)),
                              ),
                        storyList[index]['isOnline']
                            ? Positioned(
                                top: 38,
                                left: 42,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF66BB6A),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color(0xFFFFFFFF), width: 3)),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 75,
                    child: Align(
                        child: Text(
                      storyList[index]['name'],
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                ],
              ),
            );
          }))
        ],
      ),
    );
  }
}
