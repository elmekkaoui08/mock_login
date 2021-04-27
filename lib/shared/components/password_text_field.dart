import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_login/providers/password_bloc.dart';
import 'package:provider/provider.dart';

import 'costum_text_input.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
    this.isObscure = true,
    @required this.onChanged,
    this.onSuffixTap,
  }) : super(key: key);

  final bool isObscure;
  final Function onChanged;
  final Function onSuffixTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordBloc, bool>(
      builder: (context, state) => CostumTextField(
        icon: Icons.lock,
        suffixIcon: state ? Icons.visibility : Icons.visibility_off,
        hintText: 'Password',
        isObscure: state,
        onSuffixTap: () {
          context
              .read<PasswordBloc>()
              .add(state ? PasswordEvents.HIDE : PasswordEvents.SHOW);
        },
        onChange: onChanged,
      ),
    );
  }
}
