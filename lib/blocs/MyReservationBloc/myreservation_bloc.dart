import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programathon_tuercas_2020/Models/reservation.dart';
import 'package:programathon_tuercas_2020/repositories/DB/reservation_repository.dart';

part 'myreservation_event.dart';
part 'myreservation_state.dart';

class MyReservationBloc extends Bloc<MyReservationEvent, MyReservationState> {
  MyReservationBloc(this._publicatonRepository) : super(MyReservationInitial());
  final ReservationRepository _publicatonRepository;

  @override
  Stream<MyReservationState> mapEventToState(
    MyReservationEvent event,
  ) async* {
    final currentState = state;
    if (event is MyReservationFetched) {
      try {
        if (currentState is MyReservationInitial) {
          final reservations = await _fetchPosts(event.userName);
          yield MyReservationSuccess(reservation: reservations);
          return;
        } else if (currentState is MyReservationSuccess) {
          final posts = await _fetchPosts(event.userName);
          yield posts.isEmpty
              ? currentState.copyWith()
              : MyReservationSuccess(
                  reservation: currentState.reservation + posts,
                );
        }
      } catch (_) {
        yield MyReservationFailure();
      }
    }
  }

  Future<List<Reservation>> _fetchPosts(String user) async {
    return await _publicatonRepository.getByUser(user);
  }
}
