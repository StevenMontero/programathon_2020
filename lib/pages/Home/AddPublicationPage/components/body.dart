import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/components/new_publication_form.dart';

class BodyNewForm extends StatelessWidget {
  const BodyNewForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: FormPublication(),
                ))));
  }
}
