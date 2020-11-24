import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/components/body.dart';

class PublicationFormPage extends StatelessWidget {
  const PublicationFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Agregar Tour'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed('home')),
      ),
      body: BodyNewForm(),
    );
  }
}
