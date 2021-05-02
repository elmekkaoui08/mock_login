import 'package:flutter/material.dart';
import 'package:mock_login/shared/constants.dart';

class CostumTextField extends StatelessWidget {
  const CostumTextField({
    Key key,
    @required this.hintText,
    this.icon,
    this.isObscure = false,
    @required this.onChange,
    this.suffixIcon,
    this.onSuffixTap,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final IconData suffixIcon;
  final bool isObscure;
  final Function onChange;
  final Function onSuffixTap;
  final TextInputType keyboardType;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChange,
        obscureText: isObscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: InkWell(
            onTap: onSuffixTap,
            child: Icon(
              suffixIcon,
              color: kPrimaryColor,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
