part of 'reservation_cubit.dart';

class ReservationFormnState extends Equatable {
  final EmptyValidator dateCheckIn;
  final EmptyValidator dateCheckOut;
  final EmptyValidator date;
  final Number quotes;
  final FormzStatus status;
  const ReservationFormnState({
    this.date = const EmptyValidator.pure(),
    this.dateCheckIn = const EmptyValidator.pure(),
    this.dateCheckOut = const EmptyValidator.pure(),
    this.quotes = const Number.pure(),
    this.status = FormzStatus.pure,
  });

  ReservationFormnState copyWith({
    Number quotes,
    FormzStatus status,
    EmptyValidator date,
    EmptyValidator dateCheckIn,
    EmptyValidator dateCheckOut,
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
