import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/Models/reservation.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';
import 'package:programathon_tuercas_2020/repositories/DB/reservation_repository.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/no_emty.dart';
import 'package:programathon_tuercas_2020/utils/regularExpressions/numbers.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationFormnState> {
  final ReservationRepository _repReservation;
  ReservationCubit(this._repReservation)
      : assert(_repReservation != null),
        super(ReservationFormnState());

  void quotesChanged(String value) {
    final quotes = Number.dirty(value);
    emit(state.copyWith(
      quotes: quotes,
      status: Formz.validate(
          [state.dateCheckIn, state.dateCheckOut, quotes, state.date]),
    ));
  }

  void dateReservationChange(DateTime value) {
    final date = EmptyDateValidator.dirty(value);
    emit(state.copyWith(
      date: date,
      status: Formz.validate(
          [date, state.dateCheckIn, state.dateCheckOut, state.quotes]),
    ));
  }

  void dateCheckInChanged(DateTime value) {
    final dateCheckIn = EmptyDateValidator.dirty(value);

    print(dateCheckIn);
    emit(state.copyWith(
      dateCheckIn: dateCheckIn,
      status: Formz.validate(
          [dateCheckIn, state.dateCheckOut, state.quotes, state.date]),
    ));
  }

  void dateCheckOutChanged(DateTime value) {
    final dateCheckOut = EmptyDateValidator.dirty(value);
    emit(state.copyWith(
      dateCheckOut: dateCheckOut,
      status: Formz.validate(
          [state.dateCheckIn, dateCheckOut, state.quotes, state.date]),
    ));
  }

  void summitFromPublication(UserProfile user, Publication publication) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final reservation = Reservation(
        dateCheckIn: state.dateCheckIn.value,
        dateCheckOut: state.dateCheckOut.value,
        publication: publication,
        userClient: user);

    try {
      _repReservation.addNewReservation(reservation);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseException catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
