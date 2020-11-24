import 'package:flutter/foundation.dart';

enum ReservationStatus { finished, pending }

class Reservation {
  final List<String> schedule;
  final String idReservation;
  final DateTime date;
  final ReservationStatus status;
  Reservation({this.schedule, this.idReservation, this.date, this.status});
}
