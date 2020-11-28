import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:programathon_tuercas_2020/Models/reservation.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  final String imageURl;

  const ReservationCard({Key key, this.reservation, this.imageURl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 200,
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Image(
                image: NetworkImage(imageURl),
                height: 200,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reservation.publication.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4E6059)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${reservation.userClient.userName} / ${reservation.userClient.email}',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff4E6059)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${reservation.dateCheckIn.day}/${reservation.dateCheckIn.month}/${reservation.dateCheckIn.year}',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff4E6059)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Desde: ${DateFormat.jm().format(reservation.dateCheckIn)}  - Hasta: ${DateFormat.jm().format(reservation.dateCheckOut)}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff4E6059)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${reservation.publication.address.province} - ${reservation.publication.address.canton} - ${reservation.publication.address.district}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff4E6059)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${reservation.publication.address.details}',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff4E6059)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff139157)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_note,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
