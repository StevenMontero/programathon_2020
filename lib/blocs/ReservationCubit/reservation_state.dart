part of 'reservation_cubit.dart';

class ReservationFormnState extends Equatable {
  final EmptyDateValidator dateCheckIn;
  final EmptyDateValidator dateCheckOut;
  final EmptyDateValidator date;
  final Number quotes;
  final FormzStatus status;
  const ReservationFormnState({
    this.date = const EmptyDateValidator.pure(),
    this.dateCheckIn = const EmptyDateValidator.pure(),
    this.dateCheckOut = const EmptyDateValidator.pure(),
    this.quotes = const Number.pure(),
    this.status = FormzStatus.pure,
  });

  ReservationFormnState copyWith({
    Number quotes,
    FormzStatus status,
    EmptyDateValidator date,
    EmptyDateValidator dateCheckIn,
    EmptyDateValidator dateCheckOut,
  }) {
    return ReservationFormnState(
      date: date ?? this.date,
      quotes: quotes ?? this.quotes,
      status: status ?? this.status,
      dateCheckIn: dateCheckIn ?? this.dateCheckIn,
      dateCheckOut: dateCheckOut ?? this.dateCheckOut,
    );
  }

  @override
  List<Object> get props => [quotes, dateCheckIn, dateCheckOut, status];
}
