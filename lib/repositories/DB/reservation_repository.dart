import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:programathon_tuercas_2020/Models/reservation.dart';

class ReservationRepository {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('reservaciones');

  Future<void> addNewReservation(Reservation publication) {
    return _ref
        .add(publication.toJson())
        .then((value) => print('Reservation Added'))
        .catchError((error) => print('Failed to add Reservation: $error'));
  }

  Future<List<Reservation>> getListReservations() async {
    List<Reservation> reservations = new List();
    QuerySnapshot snapshot = await _ref.get();
    snapshot.docs.forEach((element) {
      reservations.add(Reservation.fromJson(element.data()));
    });

    return reservations;
  }

  Future<List<Reservation>> getByUser(String user) async {
    List<Reservation> publication = new List();
    QuerySnapshot snapshot = await _ref.get();
    final result = snapshot.docs.where((DocumentSnapshot a) =>
        a.data()['userClient']['userName'].contains(user));
    result.forEach((element) {
      publication.add(Reservation.fromJson(element.data()));
    });
    return publication;
  }

  Future<void> updateReservation(
    Reservation reservation,
  ) {
    return _ref
        .doc(reservation.idReservation)
        .update(reservation.toJson())
        .then((value) => print('Success Update'))
        .catchError((error) => print('Failure Update'));
  }

  Future<void> reservationDelete(
    Reservation reservation,
  ) {
    return _ref
        .doc(reservation.idReservation)
        .delete()
        .then((value) => print('Success Update'))
        .catchError((error) => print('Failure Update'));
  }
}
