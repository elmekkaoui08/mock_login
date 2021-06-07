import 'package:flutter/material.dart';

import 'costum_text_input.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CostumTextField(
        onChange: (value) {},
        hintText: 'Search',
        icon: Icons.search,
      ),
    );
  }
}
