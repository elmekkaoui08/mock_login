import 'package:flutter/material.dart';
import 'package:mock_login/shared/components/costum_text_input.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return CostumTextField(
        icon: Icons.person,
        hintText: 'example@domain.com',
        keyboardType: TextInputType.emailAddress,
        onChange: onChanged);
  }
}
