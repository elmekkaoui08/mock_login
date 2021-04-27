import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_login/dummy_data/data.dart';
import 'package:mock_login/shared/components/costum_text_input.dart';
import 'package:mock_login/shared/components/single_item_chat.dart';
import 'package:mock_login/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.message,
              color: kPrimaryColor,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CostumTextField(
                      onChange: (value) {},
                      hintText: 'Search',
                      icon: Icons.search,
                    ),
                  ),
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
