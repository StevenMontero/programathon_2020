import 'package:circular_profile_avatar/circular_profile_avatar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/pages/Profile/components/utils/custom_clipper.dart';
import 'package:programathon_tuercas_2020/pages/Profile/components/top_bar.dart';
import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return Container(
        height: 300.0,
        child: Stack(
          children: <Widget>[
            Container(),
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile-background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProfileAvatar(
                    state.user.photo,
                    borderWidth: 4.0,
                    radius: 60.0,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    state.user.name,
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    state.user.email,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            TopBar(),
          ],
        ),
      );
    });
  }
}
