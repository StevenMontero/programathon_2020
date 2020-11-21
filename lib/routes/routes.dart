import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/pages/Welcome/welcome_page.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    'choseLogOSig': (BuildContext context) => WelcomePage(),
  };
}
