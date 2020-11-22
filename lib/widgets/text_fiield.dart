import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {Key key,
      this.onChanged,
      this.isPassword = false,
      this.label,
      this.icon,
      this.inputType,
      this.errorOccurred = false,
      this.erroMessage = '',
      this.hintText})
      : super(key: key);
  final bool isPassword;
  final String label;
  final IconData icon;
  final TextInputType inputType;
  final errorOccurred;
  final erroMessage;
  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        errorText: errorOccurred ? erroMessage : null,
        labelText: label,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Icon(
            icon,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}
