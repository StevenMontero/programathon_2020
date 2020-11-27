part of 'myreservation_bloc.dart';

abstract class MyReservationEvent extends Equatable {
  const MyReservationEvent();

  @override
  List<Object> get props => [];
}

class MyReservationFetched extends MyReservationEvent {
  final String userName;
  MyReservationFetched({this.userName});
}
