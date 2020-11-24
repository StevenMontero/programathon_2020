import 'package:flutter/material.dart';
import 'package:programathon_tuercas_2020/widgets/text_fiield.dart';

class FormPublication extends StatefulWidget {
  FormPublication({Key key}) : super(key: key);

  @override
  _FormPublicationState createState() => _FormPublicationState();
}

class _FormPublicationState extends State<FormPublication> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        TextFieldCustom(
          label: 'Titulo',
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Flexible(
              child: TextFieldCustom(
                label: 'Precio',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Flexible(
              child: TextFieldCustom(
                label: 'Cupos',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        TextFieldCustom(
          label: 'Dirección',
          maxLines: 2,
        ),
        SizedBox(
          height: 30,
        ),
        TextFieldCustom(
          label: 'Descripción',
          maxLines: 10,
        ),
      ],
    );
  }
}
