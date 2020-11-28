import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: FontAwesomeIcons.solidUser,
              text: 'Perfil',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, 'userProfile')),
          _createDrawerItem(
              icon: FontAwesomeIcons.solidCalendar,
              text: 'Reservaciones Hechas',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, 'myreservation')),
          _createDrawerItem(
              icon: FontAwesomeIcons.solidCalendar,
              text: 'Mis Publicadas',
              onTap: () => Navigator.pushReplacementNamed(context, 'mypost')),
          _createDrawerItem(
              icon: FontAwesomeIcons.plusCircle,
              text: 'Publicar',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, 'publicationform')),
          _createDrawerItem(
              icon: FontAwesomeIcons.signOutAlt,
              text: 'Cerrar Sesión',
              onTap: () => BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLogoutRequested())),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'assets/images/closeup-shot-of-two-hummingbirds-interacting-on-twig.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
