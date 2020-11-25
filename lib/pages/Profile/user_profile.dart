import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/pages/Profile/components/card_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programathon_tuercas_2020/pages/Profile/components/stack_container.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),

            CardItem(data: '12', icon: FontAwesomeIcons.chartLine, title: 'Tours realizados'),
            CardItem(data: '25.2 km', icon: FontAwesomeIcons.walking, title: 'Distancia en tours'),
            CardItem(data: '25/3/19', icon: FontAwesomeIcons.calendar, title: 'Último tour'),
            CardItem(data: '3', icon: FontAwesomeIcons.globeAmericas, title: 'Lugares conocidos')

          ],
        ),
      ),
    );
  }
}

