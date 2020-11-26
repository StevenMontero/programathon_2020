import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/NewPublication/newpublication_cubit.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/components/body.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:formz/formz.dart';

class PublicationFormPage extends StatelessWidget {
  const PublicationFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewpublicationCubit(PublicatonRepository()),
      child: BlocListener<NewpublicationCubit, PublicationFormnState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                    content: Text(
                  'No se logro enviar el formulario',
                )),
              );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Agregar Tour'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('home')),
          ),
          body: BodyNewForm(),
        ),
      ),
    );
  }
}
