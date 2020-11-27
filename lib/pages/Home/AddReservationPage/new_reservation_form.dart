import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/NewPublication/newpublication_cubit.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/components/body.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:programathon_tuercas_2020/widgets/text_fiield.dart';
import 'package:formz/formz.dart';

class FormReservation extends StatefulWidget {
  FormReservation({Key key}) : super(key: key);

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<FormReservation> {
  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now());
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Fecha a reservar',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              Row(
                children: [
                  Text("No has escogido fecha", style: TextStyle(fontSize: 15)),
                  FlatButton(
                      child: Text('Seleccionar Fecha',
                          style: TextStyle(
                              color: Color(0xff139157), fontSize: 15)),
                      onPressed: _presentDatePicker)
                ],
              ),
              Text('Hora de entrada',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              Row(
                children: [
                  Text("No seleccionada", style: TextStyle(fontSize: 15)),
                  FlatButton(
                      child: Text('Seleccionar hora de entrada',
                          style: TextStyle(
                              color: Color(0xff139157), fontSize: 15)),
                      onPressed: _presentTimePicker)
                ],
              ),
              Text('Hora de salida',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              Row(
                children: [
                  Text("No seleccionada", style: TextStyle(fontSize: 15)),
                  FlatButton(
                      child: Text('Seleccionar hora de salida',
                          style: TextStyle(
                              color: Color(0xff139157), fontSize: 15)),
                      onPressed: _presentTimePicker)
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xff139157),
                    textColor: Colors.white,
                    child: Text("Solicitar reserva",
                        style: TextStyle(fontSize: 15)),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
