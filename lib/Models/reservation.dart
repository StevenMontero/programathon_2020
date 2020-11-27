import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/Models/user_profile.dart';

class Reservation {
  final String idReservation;
  final DateTime dateCheckIn;
  final DateTime dateCheckOut;
  final Publication publication;
  final UserProfile userClient;
  Reservation({
    this.idReservation,
    this.dateCheckIn,
    this.dateCheckOut,
    this.publication,
    this.userClient,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idReservation: json['idReservation'],
        userClient: UserProfile.fromJson(json['userClient']),
        dateCheckIn: json['dateCheckIn'].toDate(),
        dateCheckOut: json['dateCheckOut'].toDate(),
        publication: Publication.fromJson(json['publication']),
      );

  Map<String, dynamic> toJson() {
    return {
      'idReservation': this.idReservation,
      'userClient': this.userClient.toJson(),
      'publication': this.publication.toJson(),
      'dateCheckIn': this.dateCheckIn,
      'dateCheckOut': this.dateCheckIn,
    };
  }
}
