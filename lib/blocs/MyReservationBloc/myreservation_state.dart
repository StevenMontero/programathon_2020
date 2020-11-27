part of 'myreservation_bloc.dart';

abstract class MyReservationState extends Equatable {
  const MyReservationState();

  @override
  List<Object> get props => [];
}

class MyReservationInitial extends MyReservationState {}

class MyReservationFailure extends MyReservationState {}

class MyReservationSuccess extends MyReservationState {
  final List<Reservation> reservation;

  const MyReservationSuccess({
    this.reservation,
  });

  MyReservationSuccess copyWith({
    List<Reservation> reservation,
  }) {
    return MyReservationSuccess(
      reservation: reservation ?? this.reservation,
    );
  }

  @override
  List<Object> get props => [reservation];

  @override
  String toString() => 'PostSuccess { posts: ${reservation.length} }';
}
