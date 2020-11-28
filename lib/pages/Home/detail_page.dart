import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:programathon_tuercas_2020/Models/publication.dart';
import 'package:programathon_tuercas_2020/pages/Home/dumydata/country_model.dart';
import 'package:programathon_tuercas_2020/pages/Home/dumydata/data.dart';
import 'package:programathon_tuercas_2020/pages/Home/AddReservationPage/new_reservation_form.dart';
import 'package:programathon_tuercas_2020/repositories/DB/reservation_repository.dart';

import 'package:programathon_tuercas_2020/blocs/ReservationCubit/reservation_cubit.dart';

class Details extends StatefulWidget {
  final String imgUrl;
  final Publication publication;

  Details({@required this.imgUrl, @required this.publication});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<ProvinceModel> country = new List();

  @override
  void initState() {
    country = getProvince();
    super.initState();
  }

  void startAddNewReservation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return BlocProvider(
            create: (BuildContext context) =>
                ReservationCubit(ReservationRepository()),
            child: FormReservation(widget.publication),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    color: Colors.black12,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.publication.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.publication.address.province +
                                        ', ' +
                                        widget.publication.address.canton +
                                        ', ' +
                                        widget.publication.address.district,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProfileAvatar(
                    widget.publication.userProfile.photoUri,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.publication.userProfile.userName),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(widget.publication.userProfile.email)
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              widget.publication.extras.length > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.from(
                          widget.publication.extras.map((e) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: FeaturesTile(
                                  icon: e == 'Alimentación'
                                      ? Icons.fastfood
                                      : Icons.directions_bus,
                                  label: e,
                                ),
                              ))))
                  : Container(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DetailsCard(
                      title: 'Precio',
                      noOfReviews: widget.publication.price.toString(),
                      iconData: Icons.monetization_on,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    DetailsCard(
                      title: 'Cupos',
                      noOfReviews: widget.publication.quotas.toString(),
                      iconData: Icons.people,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.publication.description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff879D95)),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 240,
                child: ListView.builder(
                    itemCount: widget.publication.photos.length,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: widget.publication.getImages(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<String>> snapshot) {
                          if (snapshot.hasData)
                            return ImageListTile(
                              imgUrl: snapshot.data[index],
                            );
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          startAddNewReservation(context);
        },
        label: Text(
          'Reservar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff139157),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String noOfReviews;
  final IconData iconData;
  DetailsCard({this.iconData, this.title, this.noOfReviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xffE9F4F9), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffD5E6F2),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(iconData),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    noOfReviews,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5A6C64)),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final IconData icon;
  final String label;
  FeaturesTile({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5A6C64).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(40)),
              child: Icon(icon),
            ),
            SizedBox(
              height: 9,
            ),
            Container(
                width: 83,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5A6C64)),
                ))
          ],
        ),
      ),
    );
  }
}

class ImageListTile extends StatelessWidget {
  final String imgUrl;
  ImageListTile({@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image(
          image: NetworkImage(imgUrl),
          height: 220,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
