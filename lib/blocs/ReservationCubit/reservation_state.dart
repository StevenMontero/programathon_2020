part of 'reservation_cubit.dart';

class ReservationFormnState extends Equatable {
  final EmptyDateValidator dateCheckIn;
  final EmptyDateValidator dateCheckOut;
  final Number quotes;
  final FormzStatus status;
  const ReservationFormnState({
    this.dateCheckIn = const EmptyDateValidator.pure(),
    this.dateCheckOut = const EmptyDateValidator.pure(),
    this.quotes = const Number.pure(),
    this.status = FormzStatus.pure,
  });

  ReservationFormnState copyWith({
    Number quotes,
    FormzStatus status,
    EmptyDateValidator dateCheckIn,
    EmptyDateValidator dateCheckOut,
  }) {
    return ReservationFormnState(
      quotes: quotes ?? this.quotes,
      status: status ?? this.status,
      dateCheckIn: dateCheckIn ?? this.dateCheckIn,
      dateCheckOut: dateCheckIn ?? this.dateCheckOut,
    );
  }

  @override
  List<Object> get props => [quotes, dateCheckIn, dateCheckOut, status];
}
