import 'package:flutter/material.dart';

import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/new_publication_page.dart';
import 'package:programathon_tuercas_2020/pages/Home/home_page.dart';
import 'package:programathon_tuercas_2020/pages/Home/list_post_province_page.dart';
import 'package:programathon_tuercas_2020/pages/Login/login_page.dart';
import 'package:programathon_tuercas_2020/pages/MyPosts/my_posts.dart';
import 'package:programathon_tuercas_2020/pages/MyReservations/myreservations_page.dart';
import 'package:programathon_tuercas_2020/pages/Signup/signup_page.dart';
import 'package:programathon_tuercas_2020/pages/Profile/user_profile.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'signup': (BuildContext context) => SignupPage(),
    'publicationform': (BuildContext context) => PublicationFormPage(),
    'userProfile': (BuildContext context) => UserProfile(),
    'listpost': (BuildContext context) => ListPostProvincePage(),
    'mypost': (BuildContext context) => MyPostPage(),
    'myreservation': (BuildContext context) => MyReservationPage(),
    //   'mypost': (BuildContext context) => MyPostPage(),
  };
}
