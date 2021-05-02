import 'package:flutter/material.dart';
import 'package:mock_login/models/users.dart';
import 'package:mock_login/shared/components/or_divider.dart';
import 'package:mock_login/shared/constants.dart';

class SingleItemChatPage extends StatelessWidget {
  final Users user;

  SingleItemChatPage({this.user});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              child: ListTile(
                leading: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        //color: Colors.black87,
                      ),
                    ),
                    Text(
                      '20:22',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'We are on the way be prepared ! We are on the way be prepared !  We are on the way be prepared !',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    Container(
                      height: size.height * .04,
                      width: size.width * .08,
                      decoration: BoxDecoration(
                        color: kSuccessColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        '34',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).scaffoldBackgroundColor),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: kPrimaryLightColor,
              thickness: 2,
              indent: size.width * .2,
            )
          ],
        ),
      ],
    );
  }
}
