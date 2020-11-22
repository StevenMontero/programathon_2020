import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/theme/colors.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'signup'),
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: ColorsApp.primaryColorOrange),
          ),
        ),
      ],
    );
  }
}
