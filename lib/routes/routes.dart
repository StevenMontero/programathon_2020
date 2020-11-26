import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/new_publication_page.dart';
import 'package:programathon_tuercas_2020/pages/Home/home_page.dart';
import 'package:programathon_tuercas_2020/pages/Login/login_page.dart';
import 'package:programathon_tuercas_2020/pages/Signup/signup_page.dart';
import 'package:programathon_tuercas_2020/pages/Profile/user_profile.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'signup': (BuildContext context) => SignupPage(),
    'publicationform': (BuildContext context) => PublicationFormPage(),
    'userProfile': (BuildContext context) => UserProfile(),
  };
}
