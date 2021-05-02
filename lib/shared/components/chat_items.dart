import 'package:flutter/material.dart';
import 'package:mock_login/dummy_data/data.dart';
import 'package:mock_login/shared/components/single_item_chat.dart';

class ChatItems extends StatelessWidget {
  const ChatItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        usersList.length,
        (index) => SingleItemChatPage(
          user: usersList[index],
        ),
      ),
    );
  }
}
