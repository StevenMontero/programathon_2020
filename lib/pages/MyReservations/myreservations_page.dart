import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/MyPostBloc/mypost_bloc.dart';
import 'package:programathon_tuercas_2020/blocs/MyReservationBloc/myreservation_bloc.dart';
import 'package:programathon_tuercas_2020/repositories/DB/reservation_repository.dart';
import 'package:programathon_tuercas_2020/widgets/card_popular_turs.dart';

class MyReservationPage extends StatelessWidget {
  const MyReservationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reservaciones'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('home'),
        ),
      ),
      body: BlocProvider(
        create: (context) => MyReservationBloc(ReservationRepository())
          ..add(MyReservationFetched(userName: user)),
        child: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Mis Publicaciones",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<MyReservationBloc, MyReservationState>(
                builder: (context, state) {
                  if (state is MyReservationInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MyReservationFailure) {
                    return Center(
                      child: Text('failed to fetch posts'),
                    );
                  }
                  if (state is MyReservationSuccess) {
                    if (state.reservation.isEmpty) {
                      return Center(
                        child: Text('no posts'),
                      );
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: state.reservation.length,
                        itemBuilder: (context, index) {
                          //TODO: Hacer card para mostrar las reservaciones hechas
                          // return FutureBuilder(
                          //   future: state.reservation[index].getImages(),
                          //   builder: (BuildContext context,
                          //       AsyncSnapshot<List<String>> snapshot) {
                          //     if (snapshot.hasData)
                          //       return PopularToursCard(
                          //         imgUrl: snapshot.data[0],
                          //         publication: state.posts[index],
                          //       );
                          //     return Container();
                          //   },
                          // );
                        });
                  }
                  return Container();
                },
              )
            ])));
  }
}
