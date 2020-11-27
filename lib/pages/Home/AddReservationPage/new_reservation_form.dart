import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddPublicationPage/components/body.dart';
import 'package:programathon_tuercas_2020/repositories/DB/publication_repository.dart';
import 'package:programathon_tuercas_2020/widgets/text_fiield.dart';
import 'package:programathon_tuercas_2020/repositories/DB/reservation_repository.dart';
import 'package:programathon_tuercas_2020/blocs/ReservationCubit/reservation_cubit.dart';
import 'package:formz/formz.dart';

class ReservationFormPage extends StatelessWidget {
  const ReservationFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ReservationCubit(ReservationRepository()),
      child: FormReservation(),
    );
  }
}

class FormReservation extends StatefulWidget {
  FormReservation({Key key}) : super(key: key);

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<FormReservation> {
  _presentDatePicker() async {
    final refDate = DateTime.now();
    final picked = await showDatePicker(
        context: context,
        initialDate: refDate,
        firstDate: refDate,
        lastDate: DateTime(refDate.year + 1, refDate.month, refDate.day));

    context.read<ReservationCubit>().dateReservationChange(picked);
  }

  void _selectTime(String typeTime) async {
    final date = context.read<ReservationCubit>().state.date.value;

    if (date != null) {
      TimeOfDay selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      final dateWithTime = DateTime(date.year, date.month, date.day,
          selectedTime.hour, selectedTime.minute);
      if (typeTime == 'CheckIn') {
        context.read<ReservationCubit>().dateCheckInChanged(dateWithTime);
      } else {
        context.read<ReservationCubit>().dateCheckOutChanged(dateWithTime);
      }
    }
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
              BlocBuilder<ReservationCubit, ReservationFormnState>(
                  builder: (ctx, state) {
                final date = state.date.value;

                String dateString = '';

                if (date != null) {
                  dateString = '${date.day}/${date.month}/${date.year}';
                }

                return Row(
                  children: [
                    Text(date != null ? dateString : 'No seleccionada',
                        style: TextStyle(fontSize: 15)),
                    FlatButton(
                        child: Text(
                            date != null
                                ? 'Cambiar fecha'
                                : 'Seleccionar fecha',
                            style: TextStyle(
                                color: Color(0xff139157), fontSize: 15)),
                        onPressed: () => _presentDatePicker()),
                  ],
                );
              }),
              Text('Hora de entrada',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              BlocBuilder<ReservationCubit, ReservationFormnState>(
                  buildWhen: (previous, current) =>
                      previous.dateCheckIn != current.dateCheckIn,
                  builder: (ctx, state) {
                    return Row(
                      children: [
                        Text(
                            state.dateCheckIn.value != null
                                ? DateFormat.jm()
                                    .format(state.dateCheckIn.value)
                                : "No seleccionada",
                            style: TextStyle(fontSize: 15)),
                        FlatButton(
                            child: Text(
                                state.dateCheckIn.value != null
                                    ? 'Cambiar hora'
                                    : 'Seleccionar hora de entrada',
                                style: TextStyle(
                                    color: Color(0xff139157), fontSize: 15)),
                            onPressed: () {
                              _selectTime('CheckIn');
                            })
                      ],
                    );
                  }),
              Text('Hora de salida',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              BlocBuilder<ReservationCubit, ReservationFormnState>(
                  buildWhen: (previous, current) =>
                      previous.dateCheckOut != current.dateCheckOut,
                  builder: (ctx, state) {
                    return Row(
                      children: [
                        Text(
                            state.dateCheckOut.value != null
                                ? DateFormat.jm()
                                    .format(state.dateCheckOut.value)
                                : "No seleccionada",
                            style: TextStyle(fontSize: 15)),
                        FlatButton(
                            child: Text(
                                state.dateCheckOut.value != null
                                    ? 'Cambiar hora'
                                    : 'Seleccionar hora de salida',
                                style: TextStyle(
                                    color: Color(0xff139157), fontSize: 15)),
                            onPressed: () {
                              _selectTime('CheckOut');
                            })
                      ],
                    );
                  }),
              Text('Total de personas',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              BlocBuilder<ReservationCubit, ReservationFormnState>(
                  buildWhen: (previous, current) =>
                      previous.quotes != current.quotes,
                  builder: (ctx, state) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: 150,
                      height: 30,
                      child: TextFieldCustom(
                        inputType: TextInputType.number,
                        onChanged: (value) => context
                            .read<ReservationCubit>()
                            .quotesChanged(value),
                      ),
                    );
                  }),
              Row(
                children: [
                  Spacer(),
                  BlocBuilder<ReservationCubit, ReservationFormnState>(
                      builder: (ctx, state) {
                    return RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        // final user = BlocProvider.of<AuthenticationBloc>(context).state.user;

                        // context.read<ReservationCubit>().summitFromPublication(user);
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color(0xff139157),
                      textColor: Colors.white,
                      child: Text("Solicitar reserva",
                          style: TextStyle(fontSize: 15)),
                    );
                  }),
                ],
              )
            ]),
      ),
    );
  }
}
