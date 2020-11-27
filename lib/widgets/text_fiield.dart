import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/theme/colors.dart';

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
      this.hintText,
      this.maxLines = 1})
      : super(key: key);
  final bool isPassword;
  final String label;
  final IconData icon;
  final TextInputType inputType;
  final errorOccurred;
  final erroMessage;
  final ValueChanged<String> onChanged;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final borderDecoration = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: ColorsApp.secondaryColorlightPurple),
      gapPadding: 5,
    );
    return TextField(
      obscureText: isPassword,
      onChanged: onChanged,
      maxLines: maxLines,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        focusedBorder: borderDecoration,
        border: borderDecoration,
        enabledBorder: borderDecoration,
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
