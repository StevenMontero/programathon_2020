import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      shape: CircleBorder(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(icon),
        width: 60,
        height: 60,
      ),
    );
  }
}
