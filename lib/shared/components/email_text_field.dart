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
        validator: (value) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if (value == null || value.isEmpty || !emailValid) {
            return 'Invalid Email';
          } else {
            return null;
          }
        },
        icon: Icons.email,
        hintText: 'example@domain.com',
        keyboardType: TextInputType.emailAddress,
        onChange: onChanged);
  }
}
