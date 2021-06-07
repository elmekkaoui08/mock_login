import 'package:flutter/material.dart';
import 'package:mock_login/shared/components/chat_items.dart';
import 'package:mock_login/shared/components/costum_title.dart';
import 'package:mock_login/shared/components/saerch_bar.dart';
import 'package:mock_login/shared/components/stories.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
